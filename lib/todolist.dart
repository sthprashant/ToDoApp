import 'package:flutter/material.dart';
import './models/task.dart';

class ToDoList extends StatelessWidget {
  final List<Task> listOfTodos;
  final Function deleteTask;
  final Function taskInfo;

  ToDoList(this.listOfTodos, this.deleteTask, this.taskInfo);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 600,
      child: listOfTodos.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'All Complete!',
                  style: TextStyle(fontSize: 40),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.check_circle_outline),
                    onPressed: () {
                      deleteTask(listOfTodos[index].id);
                    },
                  ),
                  title: Text(listOfTodos[index].title),
                  //onTap: () {},
                  trailing: IconButton(
                    icon: Icon(Icons.info_outline),
                    onPressed: () {
                      taskInfo(context);
                    },
                  ),
                );
              },
              itemCount: listOfTodos.length,
            ),
    );
  }
}
