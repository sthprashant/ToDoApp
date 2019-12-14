import 'package:flutter/material.dart';

class NewTask extends StatelessWidget {
  final Function submitTask;
  final _addEntryController = TextEditingController();
  final _descriptionController = TextEditingController();
  //final String updatedText;
  //final String initVal;
  //final List<Task> taskList;

  NewTask(this.submitTask);

  void submitEntry() {
    if (_addEntryController.text.isEmpty) {
      return;
    }

    final taskName = _addEntryController.text;
    final description = _descriptionController.text;

    if(taskName.isEmpty || description.isEmpty){
      return;
    }

      submitTask(
      title:taskName,
      taskNotes: description
    );

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 400,
        child: Column(
          children: <Widget>[
            TextField(
              controller: _addEntryController,
              decoration: InputDecoration(labelText: 'Add Task'),
              onSubmitted: (_) => submitEntry(),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Add Notes'),
              onSubmitted: (_) => submitEntry(),
            ),
          ],
        ),
      ),

    );
  }
}
