import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_tecnica_bt/models/dataForPost.dart';

class ListTabs extends StatefulWidget {
  ListTabs({Key? key}) : super(key: key);

  @override
  State<ListTabs> createState() => _ListTabsState();
}

class _ListTabsState extends State<ListTabs> {
  List<Map<String, dynamic>> data1 = [];

  @override
  Widget build(BuildContext context) {
    DataForPost().dataForPost;
    return Scaffold(
        body: FutureBuilder(
      future: DataForPost().dataForPost,
      builder: (BuildContext context, AsyncSnapshot response) {
        if (response.hasData) {
          data1 = response.data;
          return response.data.isNotEmpty
              ? ListView(children: _createItem(context))
              : Center(child: Text("No data"));
        } else {
          return Center(
            child: Text(""),
          );
        }
      },
    ));
  }

  List<Widget> _createItem(BuildContext context) {
    List<Widget> temp = [];

    for (Map<String, dynamic> data in data1) {
      Widget item = ListTile(
        title: Text("${data['title']}"),
      );
      temp.add(item);
    }

    return temp;
  }
}
