import 'package:f_202010_todo_class/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:f_202010_todo_class/widgets/custom_alert_dialog.dart';

class HomePageTodo extends StatefulWidget {
  @override
  _HomePageTodoState createState() => _HomePageTodoState();
}

class _HomePageTodoState extends State<HomePageTodo> {
  List<Todo> todos = new List<Todo>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: _list(),
      floatingActionButton: new FloatingActionButton(
          onPressed: _addTodo, tooltip: 'Add task', child: new Icon(Icons.add)),
    );
  }

  Widget _list() {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, posicion) {
        var element = todos[posicion];
        return _item(element, posicion);
      },
    );
  }

  Widget _item(Todo element, int posicion) {
    Card todoCard = Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
                leading: todoIcon(element.icon),
                title: Text(element.title),
                subtitle: Text(element.body),
                isThreeLine: true)
          ],
        ),
        color: element.completed == 1 ? Colors.blueGrey : Colors.yellow[200]);
    return Dismissible(
        key: UniqueKey(),
        child: todoCard,
        direction: DismissDirection.startToEnd,
        onDismissed: (direction) {
          setState(() {
            todos.removeAt(posicion);
          });
        },
        background: Container(
            color: Colors.red,
            margin: EdgeInsets.all(4),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Deleting',
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.white)))));
  }

  void _addTodo() async {
    final todo = await showDialog<Todo>(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertDialog();
        });
    if (todo != null) {
      setState(() {
        todos.add(todo);
      });
    }
  }

  Icon todoIcon(String iconString) {
    switch (iconString) {
      case "Call":
        return Icon(Icons.call);
      case "Homework":
        return Icon(Icons.contacts);
      default:
        return Icon(Icons.check);
    }
  }
}
