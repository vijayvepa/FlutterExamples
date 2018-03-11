import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:stateful_namer/saved-suggestions-page.dart';
import 'package:stateful_namer/styles.dart';

class RandomWordsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new RandomWordsState();
  }

}

class RandomWordsState extends State<RandomWordsPage> {
  final _suggestions = <WordPair>[];
  final Set<WordPair> _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: _getAppBar(),
      body: _getListView(),
    );

  }

  AppBar _getAppBar(){

    final title = new Text('Startup Name Generator');
    final appBar = new AppBar(title: title, actions: _getActions(),);

    return appBar;
  }

  Widget _getListView() {
    return new ListView.builder(itemBuilder: _getListViewItem);
  }

  List<Widget> _getActions(){

    final iconButton = new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved);
    return <Widget>[iconButton].toList();
  }

  Widget _getListViewItem(BuildContext context, int i) {
    if (i.isOdd)
      return new Divider();

    int index = addWordPairsIfNeeded(i);
    return _getListTile(_suggestions[index]);
  }

  int addWordPairsIfNeeded(int i) {
    // The syntax "i ~/ 2" divides i by 2 and returns an integer result.
    // For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2.
    // This calculates the actual number of word pairings in the ListView,
    // minus the divider widgets.
    final index = i ~/ 2;

    if (index >= _suggestions.length) {
      _suggestions.addAll(
        generateWordPairs().take(10),
      );
    }
    return index;
  }

  Widget _getListTile(WordPair pair) {

    final alreadySaved = _saved.contains(pair);
    final color = alreadySaved ? Colors.red : null;
    final icon = new Icon(alreadySaved ? Icons.favorite: Icons.favorite_border, color: color);

    final text = new Text(pair.asPascalCase, style: Styles.biggerFont,);

    return new ListTile( title: text, trailing: icon,
        onTap: (){ _onListTileTapped(alreadySaved, pair);});
  }

  void _onListTileTapped(bool alreadySaved, WordPair pair){
    setState(() {
      if(alreadySaved){
        _saved.remove(pair);
      }else{
        _saved.add(pair);
      }
    });
  }

  void _pushSaved(){
    final route = new MaterialPageRoute(builder: (context) =>  new SavedSuggestionsPage(_saved).getPage(context));
    Navigator.of(context).push(route);
  }



}
