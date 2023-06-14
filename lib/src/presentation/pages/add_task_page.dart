import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/src/domain/models/task.dart';
import 'package:todo_list/src/presentation/pages/appbar/light_app_bar.dart';
import 'package:todo_list/src/presentation/providers/add_task_provider.dart';
import 'package:todo_list/src/presentation/style/style_library.dart';
import 'package:todo_list/src/presentation/style/theme/style_theme.dart';
import 'package:todo_list/src/routing/navigation_service.dart';

class TaskArgs {
  final Task? task;
  final int? index;

  TaskArgs(this.task, this.index);
}

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({
    Key? key,
    this.index,
    this.task,
  }) : super(key: key);

  static const routeName = 'add_task_page';
  final Task? task;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AddTaskProvider(task ?? Task.empty()),
        child: Builder(
          builder: (context) {
            var state = context.watch<AddTaskProvider>();

            return Scaffold(
                appBar: LightAppBar(
                  left: IconButton(
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    onPressed: NavigationService.pop,
                    icon: Icon(Icons.clear, color: StyleLibrary.color.primary),
                  ),
                  right: Material(
                    color: Colors.transparent,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(5),
                      ),
                      onPressed: (task != null && index != null)
                          ? () => state.change(index!, task!)
                          : state.save,
                      child: const Text('Сохранить'),
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: StyleLibrary.padding.body,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DescriptionField(
                          onChanged: state.onChanged,
                          initialValue: task?.description,
                        ),
                        StyleLibrary.padding.hBox,
                        PriorityContainer(
                          onSelect: state.selectPriority,
                          priority: task?.priority ?? Priority.none,
                        ),
                        const Divider(),
                        StyleLibrary.padding.hBox,
                        DatePickerContainer(
                          onSelect: state.selectDate,
                          onSwitch: state.switchDate,
                          initialDate: task?.date,
                        ),
                        StyleLibrary.padding.hBox,
                        const Divider(),
                        DeleteButton(
                          onRemove: (task != null)
                              ? () => state.onRemove(task!)
                              : null,
                        ),
                        StyleLibrary.padding.hBox,
                      ],
                    ),
                  ),
                ));
          },
        ));
  }
}

class DescriptionField extends StatelessWidget {
  const DescriptionField(
      {Key? key, required this.onChanged, required this.initialValue})
      : super(key: key);

  final Function(String? value) onChanged;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: StyleLibrary.color.secondary,
      color: Colors.transparent,
      child: TextFormField(
          initialValue: initialValue,
          style: Theme.of(context).textTheme.bodyMedium,
          minLines: 5,
          maxLines: 15,
          onChanged: onChanged,
          decoration: StyleLibrary.input.main.copyWith(
              fillColor: Theme.of(context).colorScheme.backSecondary,
              hintText: 'Что надо сделать...',
              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: StyleLibrary.color.tertiary,
                  ))),
    );
  }
}

class PriorityContainer extends StatefulWidget {
  const PriorityContainer(
      {Key? key, required this.onSelect, required this.priority})
      : super(key: key);

  final Function(Priority priority) onSelect;
  final Priority priority;

  @override
  State<PriorityContainer> createState() => _PriorityContainerState();
}

class _PriorityContainerState extends State<PriorityContainer> {
  Priority priority = Priority.none;
  late List<String> items;
  //late String current;

  @override
  void initState() {
    super.initState();
    items = [];
    for (var element in Priority.values) {
      items.add(element.nameField);
    }
    priority = widget.priority;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Важность', style: Theme.of(context).textTheme.bodyMedium),
        StyleLibrary.padding.hBoxMini,
        DropdownButton(
          underline: const SizedBox(),
          icon: const SizedBox(),
          value: priority.nameField,
          items: items.map<DropdownMenuItem<String>>((String value) {
            var prior = Priority.fromNameField(value);

            switch (prior) {
              case Priority.high:
                {
                  return DropdownMenuItem<String>(
                      value: value,
                      child: Row(
                        children: [
                          Text(
                            '!!',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: StyleLibrary.color.red,
                                ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(value,
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ));
                }
              case Priority.low:
                {
                  return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,
                          style: Theme.of(context).textTheme.bodyMedium));
                }
              default:
                {
                  return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: StyleLibrary.color.tertiary,
                            ),
                      ));
                }
            }
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                priority = Priority.fromNameField(value);
              });
              widget.onSelect(priority);
            }
          },
        )
      ],
    );
  }
}

class DatePickerContainer extends StatefulWidget {
  const DatePickerContainer(
      {Key? key,
      required this.onSelect,
      required this.onSwitch,
      this.initialDate})
      : super(key: key);

  final Function(DateTime dateTime) onSelect;
  final Function(bool value) onSwitch;
  final DateTime? initialDate;

  @override
  State<DatePickerContainer> createState() => _DatePickerContainerState();
}

class _DatePickerContainerState extends State<DatePickerContainer> {
  bool useDate = false;
  DateTime currentDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (widget.initialDate != null) {
      currentDate = widget.initialDate!;
      useDate = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Сделать до', style: Theme.of(context).textTheme.bodyMedium),
            (useDate)
                ? TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {
                      var now = DateTime.now();
                      showDatePicker(
                        locale: const Locale('ru'),
                        firstDate: now,
                        lastDate: DateTime(now.year + 99),
                        initialDate: DateTime.now(),
                        context: context,
                      ).then((value) {
                        if (value != null) {
                          widget.onSelect(value);
                          setState(() {
                            currentDate = value;
                          });
                        }
                      });
                    },
                    child: Text(StyleLibrary.format.main.format(currentDate)))
                : const SizedBox(),
          ],
        ),
        Switch(
            value: useDate,
            onChanged: (val) {
              setState(() {
                useDate = !useDate;
              });
              widget.onSwitch(useDate);
            })
      ],
    );
  }
}

class DeleteButton extends StatelessWidget {
  const DeleteButton({Key? key, required this.onRemove}) : super(key: key);

  final Function()? onRemove;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: (onRemove != null)
            ? TextButton.styleFrom(
                padding: EdgeInsets.zero,
                foregroundColor: StyleLibrary.color.red,
              )
            : TextButton.styleFrom(
                padding: EdgeInsets.zero,
                foregroundColor: StyleLibrary.color.disable,
                iconColor: StyleLibrary.color.disable,
              ),
        onPressed: onRemove,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.delete),
            SizedBox(width: 10),
            Text('Удалить',
                style: StyleLibrary.font.button.copyWith(
                  color: (onRemove == null)
                      ? StyleLibrary.color.disable
                      : StyleLibrary.color.red,
                )),
          ],
        ));
  }
}
