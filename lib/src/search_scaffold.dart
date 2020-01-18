import 'search_bar.dart';
import 'package:flutter/material.dart';
import 'switch_search_bar.dart';

class SearchScaffold extends StatefulWidget {
  final SearchBar searchBar;
  final AppBar appBar;
  final TextField textField;
  final Scaffold scaffold;
  final bool openDefault;

  SearchScaffold({
    this.openDefault = false,
    this.searchBar,
    this.appBar,
    this.textField,
    this.scaffold
  });

  @override
  State<StatefulWidget> createState() => SearchScaffoldState();
}

class SearchScaffoldState extends State<SearchScaffold> {
   SearchBar get searchBar => widget.searchBar;
   AppBar get appBar => widget.appBar;
   TextField get textField => widget.textField;
   Scaffold get scaffold => widget.scaffold;
   bool get openDefault => widget.openDefault;

   void initState() {
     super.initState();
     _search = ValueNotifier(openDefault);
     _controller = TextEditingController();
     _search.addListener(() {
       setState(() {});
     });
   }

   ValueNotifier<bool> _search;
   TextEditingController _controller;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SwitchSearchBar(
          appBar: appBar,
          search: _search,
          searchBar: searchBar,
          textField: TextField(
              controller: textField?.controller ?? _controller,
              onChanged: textField?.onChanged,
              onSubmitted: textField?.onSubmitted
          )
      ),
      body: scaffold?.body,
      drawer: scaffold?.drawer,
      floatingActionButton: scaffold?.floatingActionButton,
    );
  }
}
