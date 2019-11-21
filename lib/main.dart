import 'package:flutter/material.dart';


import './task_detail.dart';
import './todolist.dart';

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
  final _addEntryController = TextEditingController();

  final List<String> _listOfTodos = [];

  void submitTask() {
    if (_addEntryController.text.isEmpty) {
      return;
    }

    setState(() {
      _listOfTodos.add(_addEntryController.text);
      _addEntryController.text = "";
    });
  }

  void deleteTask(int index) {
    setState(() {
      _listOfTodos.removeAt(index);
    });
  }

  void taskInfo(context) {
    //print(context.toString());
    showBottomSheet(
      context: context,
      builder: (_){
        return GestureDetector(
          onTap: (){},
          child: TaskDetail(),
          behavior: HitTestBehavior.opaque,
        );
      }
    );
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
            child: TextField(
              controller: _addEntryController,
              decoration: InputDecoration(labelText: 'Type here to add todo'),
              onSubmitted: (_) => submitTask(),
            ),
          ),
          ToDoList(_listOfTodos, deleteTask, taskInfo),
        ],
      ),
    );
  }
}
