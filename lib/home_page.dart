import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:network_demo3/todomodel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TodoModel> listTodos = List();
  bool _fetching = true;

  void getHttp() async {
    setState(() {
      _fetching = true;
    });
    try {
      Response response =
      await Dio().get("https://www.metaweather.com/api//api/location/search/?query=hyd");
      setState(() {
        listTodos = todoModelFromJson(jsonEncode(response.data));
        _fetching = false;
      });
    } catch (e) {
      setState(() {
        _fetching = false;
      });
      print(e);
    }
  }

  @override
  void initState() {
    getHttp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // RaisedButton(
          //   child: Text(
          //     "Get Data",
          //   ),
          //   onPressed: () {
          //     getHttp();
          //   },
          // ),
          // Text("${listTodos.length}"),
          _buildBody()
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_fetching) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (listTodos.length == 0) {
      return Center(
        child: Text("No Data"),
      );
    }
    return Expanded(
      child: ListView.builder(
        itemCount: listTodos.length,
        itemBuilder: (context, index) {
          TodoModel todo = listTodos[index];
          return ListTile(
            title: Text("${todo.title}"),
          );
        },
      ),
    );
  }
}
