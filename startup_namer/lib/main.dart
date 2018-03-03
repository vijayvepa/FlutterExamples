import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final wordPair = new WordPair.random();

    var appBar = new AppBar(title: new Text('Welcome to Startup Namer'));
    var helloWorld = new Center(child: new Text(wordPair.asPascalCase),);

    var scaffold = new Scaffold(appBar: appBar, body: helloWorld,);

    var app = new MaterialApp(
      title: 'Welcome to Flutter',
      home: scaffold
    );

    return app;
  }



}