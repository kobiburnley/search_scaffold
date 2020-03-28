import 'package:flutter/material.dart';

import 'search_bar.dart';

class SwitchSearchBar extends StatelessWidget implements PreferredSizeWidget {
  final ValueNotifier<bool> search;
  final SearchBar searchBar;
  final AppBar appBar;
  final TextField textField;
  final bool alwaysOpen;

  SwitchSearchBar({
    @required this.search,
    SearchBar searchBar,
    AppBar appBar,
    this.textField,
    this.alwaysOpen = false,
  })
      : this.searchBar = searchBar ?? SearchBar(),
        this.appBar = appBar ?? AppBar();

  Widget build(BuildContext context) {
    Widget appBarWidget;
    if (search.value) {
      appBarWidget = SearchBar(
        appBar: searchBar.appBar,
        placeholder: searchBar.placeholder,
        textField: textField,
        onBack: searchBar.onBack ??
            alwaysOpen ? null : () {
          search.value = false;
        },
      );
    } else {
      appBarWidget = AppBar(
        centerTitle: appBar.centerTitle,
        leading: appBar.leading,
        title: appBar.title,
        bottom: appBar.bottom,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              search.value = !search.value;
            },
          )
        ],
      );
    }

    appBarWidget = AnimatedSwitcher(
        child: appBarWidget, duration: Duration(milliseconds: 300));

    return appBarWidget;
  }

  Size get preferredSize =>
      search.value ? searchBar.preferredSize : appBar.preferredSize;
}
