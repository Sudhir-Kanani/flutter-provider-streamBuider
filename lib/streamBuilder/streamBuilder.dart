import 'dart:async';

import 'package:flutter/material.dart';

class streamBuilder extends StatefulWidget {
  @override
  State<streamBuilder> createState() => _streamBuilderState();
}

class _streamBuilderState extends State<streamBuilder> {
  int count = 0;

  StreamController<int> streamController = StreamController<int>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Stream Builder",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: StreamBuilder(
            stream: streamController.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  snapshot.data.toString(),
                  style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                );
              } else {
                return Text(
                  "0",
                  style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                );
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            count++;
            streamController.sink.add(count);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
