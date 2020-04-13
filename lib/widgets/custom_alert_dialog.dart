import 'package:f_202010_todo_class/model/todo.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatefulWidget {
  @override
  NewCustomAlertDialog createState() => NewCustomAlertDialog();
}

class NewCustomAlertDialog extends State<CustomAlertDialog> {
  final controllerTitle = new TextEditingController();
  final controllerBody = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      title: Text('New todo',
          style:
              TextStyle(color: Theme.of(context).primaryColor, fontSize: 20.0)),
      content: Column(children: <Widget>[
        Expanded(
            child: new TextField(
          autofocus: true,
          controller: controllerTitle,
          decoration: new InputDecoration(
              labelText: 'Title', hintText: 'eg. New pending commit'),
        )),
        Expanded(
            child: new TextField(
          controller: controllerBody,
          decoration: new InputDecoration(
              labelText: 'Body', hintText: 'eg. On the master branch'),
        ))
      ]),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            controllerTitle.clear();
            controllerBody.clear();
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
            child: Text('Add'),
            onPressed: () {
              final todo = new Todo(
                  title: controllerTitle.value.text,
                  body: controllerBody.value.text,
                  completed: 0);
              controllerTitle.clear();
              controllerBody.clear();
              Navigator.of(context).pop(todo);
            })
      ],
    );
  }
}
