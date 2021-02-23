import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/features/todo/data/model/todo_model.dart';
import 'package:flutter_bloc_practice/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:flutter_bloc_practice/features/todo/presentation/page/todo_add.dart';
import 'package:flutter_bloc_practice/features/todo/presentation/widget/item_todo.dart';
import 'package:flutter_bloc_practice/injection_container.dart';

class ToDoListView extends StatefulWidget {
  @override
  _ToDoListViewState createState() => _ToDoListViewState();
}

class _ToDoListViewState extends State<ToDoListView> {
  TodoBloc todoBloc;

  @override
  void initState() {
    super.initState();
    todoBloc = getIt<TodoBloc>();
    todoBloc.add(RetrieveToDoEvent());
  }

  @override
  void dispose() {
    todoBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        centerTitle: true,
        title: Text('ToDo'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        cubit: todoBloc,
        builder: (ctx, state) {
          if (state is ToDoLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ToDoLoaded) {
            return state.toDoList.isNotEmpty
                ? ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    itemCount: state.toDoList.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        child: ItemToDoView(
                          toDoModel: state.toDoList[index],
                          deleteCallback: () {
                            print('del');
                            todoBloc.add(
                                DeleteToDoEvent(id: state.toDoList[index].id));
                          },
                          updateCallback: () {
                            print('up');
                            addTodoDialog(toDoModel: state.toDoList[index]);
                            //todoBloc.add(UpdateToDoEvent())
                          },
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text('No Data Found'),
                  );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        //onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (_) => ToDoAdd())),
        onPressed: addTodoDialog,
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }

  addTodoDialog({ToDoModel toDoModel}) {
    String todoTitle = toDoModel != null ? toDoModel.title : '';
    String todoDesc = toDoModel != null ? toDoModel.description : '';

/*
    showModal(
      context: context,
        configuration: FadeScaleTransitionConfiguration(),
        builder: (_) {
          return AlertDialog(
            title: Text(
              'Add ToDo',
              style: Theme.of(context).textTheme.headline4,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: todoTitle.isNotEmpty ? todoTitle : '',
                  ),
                  onChanged: (val) {
                    todoTitle = val;
                  },
                  onFieldSubmitted: (val) {
                    todoTitle = val;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: todoDesc.isNotEmpty ? todoDesc : '',
                  ),
                  onChanged: (val) {
                    todoDesc = val;
                  },
                  onFieldSubmitted: (val) {
                    todoDesc = val;
                  },
                ),
              ],
            ),
            actions: [
              FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              FlatButton(
                onPressed: () => Navigator.pop(
                  context,
                  [
                    todoTitle,
                    todoDesc,
                  ],
                ),
                child: Text('Submit'),
              ),
            ],
          );
        }
    );
*/

    showDialog<List<String>>(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(
              'Add ToDo',
              style: Theme.of(context).textTheme.headline4,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: todoTitle.isNotEmpty ? todoTitle : '',
                  ),
                  onChanged: (val) {
                    todoTitle = val;
                  },
                  onFieldSubmitted: (val) {
                    todoTitle = val;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: todoDesc.isNotEmpty ? todoDesc : '',
                  ),
                  onChanged: (val) {
                    todoDesc = val;
                  },
                  onFieldSubmitted: (val) {
                    todoDesc = val;
                  },
                ),
              ],
            ),
            actions: [
              FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              FlatButton(
                onPressed: () => Navigator.pop(
                  context,
                  [
                    todoTitle,
                    todoDesc,
                  ],
                ),
                child: Text('Submit'),
              ),
            ],
          );
        }).then((value) {
      if (value[0].isNotEmpty && toDoModel == null) {
        print('Value is ---------> ${value.toString()}');
        todoBloc.add(
          AddToDoEvent(
            toDoModel: ToDoModel(
              title: value[0],
              description: value[1],
            ),
          ),
        );
      } else if (value[0].isNotEmpty && toDoModel != null) {
        print('update Value is ---------> ${value.toString()}');
        todoBloc.add(
          UpdateToDoEvent(
            toDoModel: ToDoModel(
                title: value[0].isNotEmpty ? value[0] : toDoModel.title,
                description:
                    value[1].isNotEmpty ? value[1] : toDoModel.description,
                id: toDoModel.id),
          ),
        );
      }
    });
  }
}
