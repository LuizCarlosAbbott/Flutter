import 'package:api_consumer/src/home/home_bloc.dart';
import 'package:flutter/material.dart';

import 'model/post.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  HomeBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = HomeBloc();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JSON API"),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: bloc.listOut,
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          if (snapshot.hasError)
            return GestureDetector(
              child: Center(
                child: Text("Ops!! Houve um erro."),
              ),
              onTap: () {
                bloc.listIn.add(true);
              },
            );
          List<Post> posts = snapshot.data;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index) {
              Post post = posts[index];

              return ListTile(
                leading: CircleAvatar(
                  child: Text("${post.id}"),
                ),
                title: Text(post.title),
                subtitle: Text(post.body),
              );
            },
          );
        },
      ),
    );
  }
}
