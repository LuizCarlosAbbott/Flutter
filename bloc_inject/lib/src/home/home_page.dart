import 'package:bloc_inject/src/home/home_bloc.dart';
import 'package:bloc_inject/src/shared/models/post.dart';
import 'package:bloc_inject/src/shared/repositories/general_api.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = HomeBloc(GeneralApi());
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
        title: Text("Inject"),
      ),
      body: StreamBuilder<List<Post>>(
        // stream: bloc.listOut,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          List<Post> posts = snapshot.data;
          return ListView.separated(
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(posts[index].title),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
          );
        },
      ),
    );
  }
}
