import 'package:flutter/material.dart';
import 'package:todo/new_task.dart';

//import './new_task.dart';
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

  void submitTask({String title, String taskNotes, DateTime date}) {
    Navigator.of(context).pop();
    final newTask = Task(
      id: DateTime.now().toString(),
      title: title,
      taskNotes: taskNotes,
      date: date,
    );
    setState(() {
      _listOfTodos.add(newTask);
    });
    
  }

  void addTaskSheet(BuildContext cntxt) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {
            },
            child:NewTask(submitTask),
            behavior: HitTestBehavior.opaque,
          );
        });
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

  void taskInfo(BuildContext context, int index) {
    //print(context.toString());
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: TaskDetail(
            _listOfTodos,
            index,
          ),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('ToDo App'),
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // Container(
            //   child: NewTask(submitTask),
            // ),
            ToDoList(_listOfTodos, deleteTask, taskInfo),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => addTaskSheet(context),
      ),
    );
  }
}
