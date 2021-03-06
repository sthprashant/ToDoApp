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

    if (taskName.isEmpty || description.isEmpty) {
      return;
    }

    submitTask(title: taskName, taskNotes: description);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 400,
        padding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _addEntryController,
              decoration: InputDecoration(labelText: 'Task name'),
              onSubmitted: (_) => submitEntry(),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Task Details'),
              onSubmitted: (_) => submitEntry(),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text('no due date'),
                  ),
                  FlatButton(
                    child: Text('Set Due Date'),
                    onPressed: () {},
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                     // side: BorderSide(color: Colors.red),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
