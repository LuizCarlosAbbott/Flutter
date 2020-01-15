import 'package:flutter/material.dart';
import 'package:sqlite_reativo/src/db/my_database.dart';

class AddTodo extends StatefulWidget {
  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add ToDo"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            onChanged: (value) {
              text = value;
            },
          ),
          RaisedButton(
            onPressed: () async {
              await MyDatabase.instance
                  .addTodo(Todo(descripition: text, completed: false));
              Navigator.pop(context);
            },
            child: Text("Adicionar"),
          )
        ],
      ),
    );
  }
}
