import 'package:flutter/material.dart';

import './models/task.dart';

class TaskDetail extends StatelessWidget {
  final List<Task> todos;
  final int index;
  final Function updateTask;

  TaskDetail(this.todos, this.index, this.updateTask);

  void updateTaskDetail() {}
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // Text(todos[index].title),
                        // IconButton(
                        //   icon: Icon(
                        //     Icons.edit,
                        //     size: 15,
                        //   ),
                        //   onPressed: (){},
                        // )
                        TextFormField(),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
