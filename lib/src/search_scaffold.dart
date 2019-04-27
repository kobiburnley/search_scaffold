import 'search_bar.dart';
import 'package:flutter/material.dart';
import 'switch_search_bar.dart';
import 'package:use_state_builder/use_state_builder.dart';

class SearchScaffold extends StatelessWidget {
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

  Widget build(BuildContext context) {
    return UseStateBuilder(builder: (context, useState) {
      final search = useState(openDefault);
      final controller = useState(TextEditingController());

      return Scaffold(
        appBar: SwitchSearchBar(
            appBar: appBar,
            search: search,
            searchBar: searchBar,
            textField: TextField(
              controller: textField?.controller ?? controller.value,
              onChanged: textField?.onChanged,
              onSubmitted: textField?.onSubmitted
            )
        ),
        body: scaffold?.body,
        floatingActionButton: scaffold?.floatingActionButton,
      );
    });
  }
}
