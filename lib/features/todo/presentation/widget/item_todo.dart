import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_practice/features/todo/data/model/todo_model.dart';
import 'package:flutter_bloc_practice/features/todo/presentation/page/todo_detail.dart';
import 'package:intl/intl.dart';

class ItemToDoView extends StatelessWidget {
  final ToDoModel toDoModel;
  final VoidCallback deleteCallback;
  final VoidCallback updateCallback;

  ItemToDoView({
    this.toDoModel,
    this.deleteCallback,
    this.updateCallback,
  });

  @override
  Widget build(BuildContext context) {
    String date = DateFormat('dd-MM-yyyy')
        .format(DateTime.fromMillisecondsSinceEpoch(toDoModel.createdOn));
    String time = DateFormat('jm')
        .format(DateTime.fromMillisecondsSinceEpoch(toDoModel.createdOn));

    return OpenContainer(
      closedBuilder: (_,openContainer){
        return GestureDetector(
          onTap: openContainer,
          child: Dismissible(
            key: ValueKey(toDoModel.id),
            background: Container(
              padding: EdgeInsets.only(left: 12),
              color: Colors.red,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.delete,
                  size: 20,
                ),
              ),
            ),
            secondaryBackground: Container(
              color: Colors.green,
              padding: EdgeInsets.only(right: 12),
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.edit,
                  size: 20,
                ),
              ),
            ),
            confirmDismiss: (direction) {
              if (direction == DismissDirection.endToStart) {
                deleteCallback();
                return Future.value(true);
              } else {
                updateCallback();
                return Future.value(false);
              }
            },
            child: ListTile(
              title: Text(toDoModel.title),
              subtitle: Text(toDoModel.description),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    date,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    time,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      closedColor: Colors.white,
      closedElevation: 10.0,
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      transitionType: ContainerTransitionType.fadeThrough,
      transitionDuration: Duration(milliseconds: 500),
      useRootNavigator: true,
      openBuilder: (context, closeContainer) {
        return ToDoDetail(toDoModel: toDoModel,);
      },
    );
  }
}
