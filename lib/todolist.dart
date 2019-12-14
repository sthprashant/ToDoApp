import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import './models/task.dart';

class ToDoList extends StatelessWidget {
  final List<Task> _listOfTodos;
  final Function deleteTask;
  final Function taskInfo;

  ToDoList(this._listOfTodos, this.deleteTask, this.taskInfo);

  @override
  Widget build(BuildContext context) {
    DismissDirection dismissDirection;

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(10),
        height: 600,
        child: _listOfTodos.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Center(
                    child: Text(
                      'All Complete!',
                      style: TextStyle(fontSize: 40),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
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
                        // leading: IconButton(
                        //   padding: EdgeInsets.all(0),
                        //   icon: Icon(Icons.check),
                        //   onPressed: () {
                        //     deleteTask(_listOfTodos[index].id);
                        //   },
                        // ),
                        title: Text(_listOfTodos[index].title),
                        subtitle: Text('data'),
                        //onTap: () {},
                        // trailing: FittedBox(
                        //   child: Row(
                        //     children: <Widget>[
                        //       IconButton(
                        //         icon: Icon(Icons.info_outline),
                        //         onPressed: () {
                        //           taskInfo(context, index);
                        //         },
                        //       ),
                        //       IconButton(
                        //         icon: Icon(Icons.delete_forever),
                        //         onPressed: () {
                        //           deleteTask(_listOfTodos[index].id);
                        //         },
                        //       ),
                        //     ],
                        //   ),
                        // ), s
                      ),
                      //direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        if (direction == DismissDirection.endToStart) {
                          deleteTask(_listOfTodos[index].id);
                        }
                        if (direction == DismissDirection.startToEnd) {
                          print(direction);
                        }
                      },
                      secondaryBackground: deleteBackGround(),
                    ),
                  );
                },
                itemCount: _listOfTodos.length,
              ),
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
