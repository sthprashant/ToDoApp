import 'package:flutter/material.dart';

import './new_task.dart';
import './task_detail.dart';
import './todolist.dart';
import './models/task.dart';

void main() => runApp(MyTodo());

class MyTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Task> _listOfTodos = [];

  void submitTask(String title) {
    final newTask = Task(
      id: DateTime.now().toString(),
      title: title,
    );
    setState(() {
      _listOfTodos.add(newTask);
    });

    // if (_addEntryController.text.isEmpty) {
    //   return;
    // }
    // final newTask = Task(
    //   id: DateTime.now().toString(),
    //   title: _addEntryController.text,

    // );

    // setState(() {
    //   _listOfTodos.add(newTask);
    //   _addEntryController.text = "";
    // });
  }

  void deleteTask(String id) {
    setState(() {
      _listOfTodos.removeWhere((task) {
        return task.id == id;
      });
    });
    // setState(() {
    //   _listOfTodos.removeAt(index);
    // });
  }

  void updateTask({String title, String notes}){
      setState(() {
        
      });
  }

  void taskInfo(BuildContext context, int index) {
    //print(context.toString());
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: TaskDetail(_listOfTodos,index,updateTask),
            //behavior: HitTestBehavior.opaque,
          );
        },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo App'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: NewTask(submitTask),
          ),
          ToDoList(_listOfTodos, deleteTask, taskInfo),
        ],
      ),
    );
  }
}
