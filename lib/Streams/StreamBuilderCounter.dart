// Simple Counter App using Streams and StreamController
import 'dart:async';

import 'package:flutter/material.dart';

class StreamBuilderCounter extends StatefulWidget {
  const StreamBuilderCounter({Key? key}) : super(key: key);

  @override
  _StreamBuilderCounterState createState() => _StreamBuilderCounterState();
}

class _StreamBuilderCounterState extends State<StreamBuilderCounter> {

  StreamController counterController = StreamController();
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Counter App"),
      ),
      body: Center(
        child: StreamBuilder(
            stream: counterController.stream,
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                return Text(snapshot.data.toString(), style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),);
              }
              else {
                return const Text("0", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),);
              }
            },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          i++;
          counterController.sink.add(i);
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
