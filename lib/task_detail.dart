import 'package:flutter/material.dart';

class TaskDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      //height: 300,
      //width: 450,
      child: Card(
            elevation: 50,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Text('data'),
            ],
          ),
        ),
        
      ),
    );
  }
}
