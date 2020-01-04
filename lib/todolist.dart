import 'package:flutter/material.dart';

import './models/task.dart';
//import './task_detail.dart';

class ToDoList extends StatelessWidget {
  final List<Task> _listOfTodos;
  final Function deleteTask;
  final Function taskInfo;
  final Function completeTask;

  ToDoList(
      this._listOfTodos, this.deleteTask, this.taskInfo, this.completeTask);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 400,
      child: _listOfTodos.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Tasks all complete!',
                    style: Theme.of(context).textTheme.title,
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    height: 200,
                    child: Opacity(
                      opacity: 0.2,
                      child: Image.asset(
                        'assets/images/smile.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Container(
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.all(0),
                  child: Dismissible(
                    background: completeBackGround(),
                    key: Key(
                      _listOfTodos[index].id,
                    ),
                    child: ListTile(
                      onTap:() => taskInfo(context,index),
                      title: Text(
                        _listOfTodos[index].title,
                        style: Theme.of(context).textTheme.title,
                      ),
                      subtitle: Text('data'),
                    ),
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        deleteTask(_listOfTodos[index].id);
                      }
                      if (direction == DismissDirection.startToEnd) {
                        completeTask(_listOfTodos[index]);
                      }
                    },
                    secondaryBackground: deleteBackGround(),
                  ),
                );
              },
              itemCount: _listOfTodos.length,
            ),
    );
  }

  Widget deleteBackGround() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.0),
      color: Colors.red,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }

  Widget completeBackGround() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(right: 20.0),
      color: Colors.green,
      child: Icon(
        Icons.check,
        color: Colors.white,
      ),
    );
  }
}
