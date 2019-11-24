import 'package:flutter/material.dart';

class NewTask extends StatelessWidget {
  final Function submitTask;
  final _addEntryController = TextEditingController();
  //final String initVal;
  //final List<Task> taskList;

  NewTask(this.submitTask);

  void submitEntry() {
    if (_addEntryController.text.isEmpty) {
      return;
    }

    submitTask(_addEntryController.text);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
            controller: _addEntryController,
            decoration: InputDecoration(labelText: 'Type here to add todo'),
            onSubmitted: (_) => submitEntry());
  }
}
