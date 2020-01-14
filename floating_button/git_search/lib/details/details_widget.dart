import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_search/models/search_item.dart';

class DetailsWidget extends StatefulWidget {
  final SearchItem item;

  const DetailsWidget({Key key, this.item}) : super(key: key);

  @override
  _DetailsWidgetState createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 20,
              ),
              Hero(
                tag: widget.item.avatarUrl,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(widget.item?.avatarUrl ??
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJCURI8xD1gPqYaJ1OdPNlLZ7pVRS1zuNaSApS35_RuMO1g2vP&s"),
                ),
              ),
              Container(
                height: 10,
              ),
              Text(
                widget.item.fullName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.grey[700]),
              ),
              Container(height: 10,),
              Text(
                widget.item.url,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
