import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_list/src/presentation/pages/appbar/custom_app_bar.dart';
import 'package:todo_list/src/presentation/style/style_library.dart';

//todo: Переместить контроллер
class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

  static const String routeName = 'homePage';
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics()
        ),
        controller: scrollController,
        slivers: <Widget>[
          AppBar(scrollController: scrollController),
          SliverPadding(
            padding: StyleLibrary.padding.content,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 20,
                (BuildContext context, int index) {
                  return DismissibleCard(index: index);
                },

              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({Key? key, required this.scrollController}) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: false,
      delegate: CustomAppBarDelegate(
          maxExtent: 250,
          minExtent: 80,
          title: 'Мои дела',
          subTitle: 'Выполнено - 0',
          action: Material(
            color: Colors.transparent,
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: (){},
              icon: const Icon( Icons.remove_red_eye_sharp),
            ),
          )
      )
    );
  }
}


class DismissibleCard extends StatefulWidget {
  const DismissibleCard({Key? key, required this.index}) : super(key: key);

  final int index;

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
        child:  const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.check, color: Colors.white, size: 30,),
            ],
          ),
        )
      ),
      secondaryBackground: Container(
        color: StyleLibrary.color.red,
        child:  const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.delete, color: Colors.white, size: 30,),
            ],
          ),
        )
      ),
      child: TaskCard(
        isFirst: widget.index == 0,
        isLast: widget.index == 19,
      ),
    );
  }


}



class TaskCard extends StatefulWidget {
  const TaskCard({Key? key, required this.isFirst, required this.isLast }) : super(key: key);

  final bool isFirst;
  final bool isLast;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {

  bool isComplete = false;

  @override
  Widget build(BuildContext context) {

    //todo: не перерисовываются бордеры после удаления
    var border = BorderRadius.zero;
    if(widget.isFirst) {
      border = const BorderRadius.only(
          topRight: Radius.circular(8),
          topLeft: Radius.circular(8)
      );
    }
    if(widget.isLast) {
      border = const BorderRadius.only(
          bottomRight: Radius.circular(8),
          bottomLeft: Radius.circular(8)
      );
    }
    if(widget.isFirst && widget.isLast){
      border = const BorderRadius.all(Radius.circular(8));
    }

    return Container(
      decoration:  BoxDecoration(
        borderRadius: border,
        color: Theme.of(context).colorScheme.secondary
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                  value: isComplete,
                  onChanged: changeStatus,
              ),
              Expanded(
                child: Padding(
                  padding: StyleLibrary.padding.taskCard,
                  child: Text('Тут какой-то контент ',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: (isComplete)
                          ? StyleLibrary.color.tertiary
                          : Theme.of(context).textTheme.bodyMedium?.color,
                      decoration: (isComplete)
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    )
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: IconButton(
                  padding: EdgeInsets.zero,
                    onPressed: (){},
                    icon:  Icon(Icons.info_outline, color: StyleLibrary.color.tertiary,),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void changeStatus(bool? value){
     if(value != null){
       setState(() {
         isComplete = value;
       });
     }
  }
}




