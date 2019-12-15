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
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              button: TextStyle(color: Colors.white),
            ),
      ),
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
  final List<Task> _completedListOfTodos = [];

  void submitTask({String title, String taskNotes, DateTime date}) {
    Navigator.of(context)
        .pop(); // this closes the modal after text field has been submitted,
    // needs a stateful widget, does not work in stateless
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
            onTap: () {},
            child: NewTask(submitTask),
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

  void completeTask(Task newTodo) {
    setState(() {
      _completedListOfTodos.add(newTodo);
    });
    deleteTask(newTodo.id);
  }

  void taskInfo(BuildContext context, int index) {
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
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('ToDo App'),
      ),
      body: Column(
        children: <Widget>[
          ToDoList(_listOfTodos, deleteTask, taskInfo, completeTask),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => addTaskSheet(context),
      ),
    );
  }
}
