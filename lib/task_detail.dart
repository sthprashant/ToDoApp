import 'package:flutter/material.dart';

import './models/task.dart';

class TaskDetail extends StatelessWidget {
  final List<Task> todos;
  final int index;

  final taskName = TextEditingController();

  TaskDetail(this.todos, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 300,
      //width: 450,
      child: Card(
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 50,
        margin: EdgeInsets.all(0),
        child: Container(
          //padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(todos[index].title),
                    Text(todos[index].taskNotes),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
