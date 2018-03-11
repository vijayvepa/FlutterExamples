import 'package:flutter/material.dart';
import 'package:stateful_namer/random-words-page.dart';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: 'Welcome to Flutter', home: _getHome(),);
  }

  Scaffold _getHome(){
    final appBar = new AppBar(title: new Text('Startup Names'));
    final body = new Center(child: new RandomWordsPage());

    return new Scaffold(appBar: appBar, body: body,);

  }

}