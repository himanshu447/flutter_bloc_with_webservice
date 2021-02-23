
import 'package:flutter/material.dart';

class ToDoAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
	    appBar: AppBar(
		    title: Text('ToDo ADD'),
	    ),
	    body: Column(
		    crossAxisAlignment: CrossAxisAlignment.center,
		    children: [
		    	Text('Check For Animation',style: Theme.of(context).textTheme.headline4,)
		    ],
	    ),
    );
  }
}
