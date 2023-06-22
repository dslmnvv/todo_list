import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/src/domain/models/task.dart';
import 'package:todo_list/src/presentation/pages/appbar/custom_app_bar.dart';
import 'package:todo_list/src/presentation/providers/home_provider.dart';
import 'package:todo_list/src/presentation/style/style_library.dart';
import 'package:todo_list/src/presentation/style/theme/style_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = 'homePage';

  @override
  Widget build(BuildContext context) {
    var state = context.watch<HomeProvider>();
    return Scaffold(
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        slivers: <Widget>[
          AppBar(
            title: 'Мои дела',
            subTitle: 'Выполнено - ${state.complete}',
            onTapEye: state.showAllTasks,
          ),
          (state.tasks.isNotEmpty)
              ? SliverPadding(
                  padding: StyleLibrary.padding.content,
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: state.tasks.length + 1,
                      (BuildContext context, int index) {
                        if (index == state.tasks.length) {
                          return Container(
                            decoration: BoxDecoration(
                                color:
                                    Theme.of(context).colorScheme.backSecondary,
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 50,
                                ),
                                TextButton(
                                  onPressed: state.openAddTaskPage,
                                  child: Text(
                                    'Новое',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                          color: StyleLibrary.color.tertiary,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                        return DismissibleCard(
                            index: index,
                            len: state.tasks.length,
                            task: state.tasks.elementAt(index),
                            onDismiss: () =>
                                state.removeTask(state.tasks.elementAt(index)),
                            onChangeStatus: state.changeStatusTask,
                            openChangeTask: () => state.openChangeTaskPage(
                                  index,
                                ));
                      },
                    ),
                  ),
                )
              : SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Ура, все дела выполнены  🥳',
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: state.openAddTaskPage,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar(
      {Key? key,
      required this.subTitle,
      required this.title,
      required this.onTapEye})
      : super(key: key);

  final String title;
  final String subTitle;
  final Function(bool value) onTapEye;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        pinned: true,
        floating: false,
        delegate: CustomAppBarDelegate(
            maxExtent: 250,
            minExtent: 80,
            title: title,
            subTitle: subTitle,
            action: Material(
              color: Colors.transparent,
              child: EyeButton(
                onPressed: onTapEye,
              ),
            )));
  }
}

class EyeButton extends StatefulWidget {
  const EyeButton({Key? key, required this.onPressed}) : super(key: key);

  final Function(bool value) onPressed;

  @override
  State<EyeButton> createState() => _EyeButtonState();
}

class _EyeButtonState extends State<EyeButton> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        onPressed: () {
          setState(() {
            show = !show;
          });
          widget.onPressed(show);
        },
        icon: (show)
            ? const Icon(Icons.visibility_sharp)
            : const Icon(Icons.visibility_off));
  }
}

class DismissibleCard extends StatefulWidget {
  const DismissibleCard({
    Key? key,
    required this.index,
    required this.len,
    required this.task,
    required this.onDismiss,
    required this.onChangeStatus,
    required this.openChangeTask,
  }) : super(key: key);

  final int index;
  final int len;
  final Task task;
  final Function() onDismiss;
  final Function(bool status, int index) onChangeStatus;
  final Function() openChangeTask;

  @override
  State<DismissibleCard> createState() => _DismissibleCardState();
}

class _DismissibleCardState extends State<DismissibleCard> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
          color: StyleLibrary.color.green,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 30,
                ),
              ],
            ),
          )),
      secondaryBackground: Container(
          color: StyleLibrary.color.red,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 30,
                ),
              ],
            ),
          )),
      onDismissed: (direction) {
        if(direction.name == 'startToEnd'){
          widget.onChangeStatus(true, widget.index);
        }else{
          widget.onDismiss();
        }

      },
      child: TaskCard(
        index: widget.index,
        isFirst: widget.index == 0,
        isLast: widget.index == widget.len - 1,
        task: widget.task,
        onChangeStatus: widget.onChangeStatus,
        openChangeTask: widget.openChangeTask,
      ),
    );
  }
}

class TaskCard extends StatefulWidget {
  const TaskCard({
    Key? key,
    required this.isFirst,
    required this.isLast,
    required this.task,
    required this.onChangeStatus,
    required this.index,
    required this.openChangeTask,
  }) : super(key: key);

  final bool isFirst;
  final bool isLast;
  final Task task;
  final int index;
  final Function(bool status, int index) onChangeStatus;
  final Function() openChangeTask;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  late bool isComplete;

  @override
  void initState() {
    super.initState();
    isComplete = widget.task.done;
  }

  @override
  Widget build(BuildContext context) {
    var border = BorderRadius.zero;
    if (widget.isFirst) {
      border = const BorderRadius.only(
          topRight: Radius.circular(8), topLeft: Radius.circular(8));
    }
    if (widget.isLast) {
      border = const BorderRadius.only(
          bottomRight: Radius.circular(8), bottomLeft: Radius.circular(8));
    }
    if (widget.isFirst && widget.isLast) {
      border = const BorderRadius.all(Radius.circular(8));
    }

    log('${widget.task}', name: 'TaskCard');

    return Container(
      decoration: BoxDecoration(
          borderRadius: border,
          color: Theme.of(context).colorScheme.backSecondary),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Stack(
                children: [
                  Checkbox(
                    fillColor: (widget.task.importance == Priority.important)
                        ? Theme.of(context).colorScheme.highPrioryCheckBox.fillColor
                        : Theme.of(context).checkboxTheme.fillColor,
                    side: (widget.task.importance == Priority.important)
                        ? Theme.of(context).colorScheme.highPrioryCheckBox.side
                        : Theme.of(context).checkboxTheme.side,
                    value: isComplete,
                    onChanged: changeStatus,

                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: StyleLibrary.padding.taskCard,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      (widget.task.importance == Priority.important)
                          ? Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Text(
                                '!!',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontSize: 20,
                                      color: StyleLibrary.color.red,
                                    ),
                              ),
                            )
                          : const SizedBox(),
                      (widget.task.importance == Priority.low)
                          ? Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.arrow_downward,
                                color: StyleLibrary.color.tertiary,
                              ))
                          : const SizedBox(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.task.text,
                              maxLines: 3,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    overflow: TextOverflow.ellipsis,
                                    color: (isComplete)
                                        ? StyleLibrary.color.tertiary
                                        : Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.color,
                                    decoration: (isComplete)
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                  )),
                          (widget.task.deadline != null)
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    StyleLibrary.format.main
                                        .format(widget.task.deadline!),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                            color: StyleLibrary.color.tertiary),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: widget.openChangeTask,
                  icon: Icon(
                    Icons.info_outline,
                    color: StyleLibrary.color.tertiary,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void changeStatus(bool? value) {
    if (value != null) {
      setState(() {
        isComplete = value;
        widget.onChangeStatus(value, widget.index);
      });
    }
  }
}
