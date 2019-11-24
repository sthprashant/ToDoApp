import 'package:flutter/material.dart';
import 'package:todo/new_task.dart';

import './models/task.dart';

class TaskDetail extends StatelessWidget {
  final List<Task> todos;
  final int index;
  final Function updateTask;
  final taskName = TextEditingController();

  TaskDetail(this.todos, this.index, this.updateTask);

  void updateField(String text) {}
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      //height: 300,
      //width: 450,
      child: Card(
        elevation: 50,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              
               
            ],
          ),
        ),
      ),
    );
  }
}
