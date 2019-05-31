import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  final String placeholder;
  final AppBar appBar;
  final VoidCallback onBack;
  final TextField textField;

  SearchBar({String placeholder = "",
    this.onBack,
    AppBar appBar,
    this.textField})
      : this.appBar = appBar ?? AppBar(),
        this.placeholder = placeholder;

  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return AppBar(
      leading: appBar.leading ??
          IconButton(
              icon: const BackButtonIcon(),
              color: theme.textTheme.title.color,
              onPressed: onBack),
      backgroundColor: appBar.backgroundColor ?? theme.scaffoldBackgroundColor,
      title: TextField(
        controller: textField?.controller,
        autofocus: true,
        textInputAction: textField?.textInputAction ?? TextInputAction.search,
        decoration: InputDecoration(
          hintText: placeholder,
          suffixIcon: textField?.decoration?.suffixIcon ?? GestureDetector(
            child: Icon(Icons.clear),
            onTap: () {
              textField?.controller?.clear();
              textField?.onChanged(textField?.controller?.value?.text);
            },
          ),
          contentPadding: EdgeInsets.only(top: 16.0, bottom: 16.0),
//          filled: true,
          border: InputBorder.none,
          enabled: true,
        ),
        onSubmitted: textField?.onSubmitted,
        onChanged: textField?.onChanged,
      ),
      bottom: appBar.bottom,
    );
  }

  Size get preferredSize => appBar.preferredSize;
}
