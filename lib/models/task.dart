import 'package:flutter/foundation.dart';

class Task {
  final String id;
  final String title;
  final String taskNotes;
  final DateTime date;

  Task({@required this.id, @required this.title, this.taskNotes, this.date});
}
