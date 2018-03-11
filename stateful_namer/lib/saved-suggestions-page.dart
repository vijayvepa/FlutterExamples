import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:stateful_namer/styles.dart';

class SavedSuggestionsPage{

  Set<WordPair> _savedSuggestions;

  SavedSuggestionsPage(Set<WordPair> savedSuggestions){
    _savedSuggestions = savedSuggestions;
  }

  Scaffold getPage(BuildContext context){
    return new Scaffold(appBar: _getAppBar(), body: _getListView(context),);
  }

  AppBar _getAppBar(){
    final text = new Text('Saved Suggestions');
    return new AppBar(title: text);
  }

  ListView _getListView(BuildContext context){

    final tiles = _savedSuggestions.map((pair) => _getListTile(pair)).toList();
    final dividedTiles = _getTilesWithSpacing(context, tiles);

    return new ListView(children: dividedTiles,);
  }


  ListTile _getListTile(WordPair pair){
    final text=  new Text(pair.asPascalCase, style:  Styles.biggerFont,);
    return new ListTile(title: text);
  }

  List<ListTile> _getTilesWithSpacing(BuildContext context,  List<ListTile> tiles){
    return  ListTile.divideTiles(tiles: tiles, context: context).toList();
  }


}