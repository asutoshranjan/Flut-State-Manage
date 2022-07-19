import 'package:flut_py/ListApp.dart';
import 'package:flut_py/Streams/StreamBuilderCounter.dart';
import 'package:flut_py/Streams/StreamCertificates.dart';
import 'package:flut_py/java%20calculaor.dart';
import 'package:flut_py/provider/consumerofpizza.dart';
import 'package:flutter/material.dart';
import 'java/calculator.java';

void main() {
  runApp(const MyPizza());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: StreamCertificate(),
    );
  }
}