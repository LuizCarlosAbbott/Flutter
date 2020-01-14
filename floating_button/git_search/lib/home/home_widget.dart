import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_search/blocs/home_bloc.dart';
import 'package:git_search/details/details_widget.dart';
import 'package:git_search/models/search_item.dart';
import 'package:git_search/models/search_result.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  HomeBloc bloc;

  @override
  void dispose() {
    bloc?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    bloc = HomeBloc();
  }

  Widget _textField() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          onChanged: bloc.searchEvent.add,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Pesquisa...",
              labelText: "Pesquisa"),
        ));
  }

  Widget _items(SearchItem item) {
    return ListTile(
      leading: Hero(
        tag: item.avatarUrl,
        child: CircleAvatar(
          backgroundImage: NetworkImage(item?.avatarUrl ??
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJCURI8xD1gPqYaJ1OdPNlLZ7pVRS1zuNaSApS35_RuMO1g2vP&s"),
        ),
      ),
      title: Text(item?.fullName ?? "title"),
      subtitle: Text(item?.url ?? "url"),
      onTap: () => Navigator.push(context,
          CupertinoPageRoute(builder: (context) => DetailsWidget(item: item))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Github Search"),
        ),
        body: ListView(
          children: <Widget>[
            _textField(),
            StreamBuilder(
              stream: bloc.listItems,
              builder:
                  (BuildContext context, AsyncSnapshot<SearchResult> snapshot) {
                return snapshot.hasData
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: snapshot.data.items.length,
                        itemBuilder: (BuildContext context, int index) {
                          SearchItem item = snapshot?.data.items[index];
                          return _items(item);
                        })
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
            )
          ],
        ));
  }
}
