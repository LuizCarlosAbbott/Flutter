import 'package:flutter/material.dart';
import 'package:sqlite_reativo/src/add_todo.dart';
import 'package:sqlite_reativo/src/db/my_database.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SQLite"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return AddTodo();
              }));
            },
          )
        ],
      ),
      body: StreamBuilder<List<Todo>>(
        stream: MyDatabase.instance.getAllTodos(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          List<Todo> list = snapshot.data;

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    MyDatabase.instance.deleteTodo(list[index].id);
                  },
                ),
                title: Text(list[index].descripition),
              );
            },
          );
        },
      ),
    );
  }
}
