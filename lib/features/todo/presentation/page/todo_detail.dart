
import 'package:flutter/material.dart';
import 'package:flutter_bloc_practice/features/todo/data/model/todo_model.dart';

class ToDoDetail extends StatelessWidget {
	
	final ToDoModel toDoModel;

  const ToDoDetail({Key key, this.toDoModel}) : super(key: key);
	
	
  @override
  Widget build(BuildContext context) {
    return Scaffold(
	    appBar: AppBar(
		    title: Text('Todo Detail'),
	    ),
	    body: Center(
	      child: Column(
		    mainAxisAlignment: MainAxisAlignment.center,
		    crossAxisAlignment: CrossAxisAlignment.center,
		    children: [
		    	Text(toDoModel.title,style: Theme.of(context).textTheme.headline6,),
		    	Text(toDoModel.title,style: Theme.of(context).textTheme.bodyText1,),
		    ],
	      ),
	    ),
    );
  }
}
