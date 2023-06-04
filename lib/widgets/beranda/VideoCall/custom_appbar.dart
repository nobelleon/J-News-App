import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget leading;
  final Widget title;
  final List<Widget> actions;
  final Color color;
  final bool centerTitle;

  const CustomAppBar({
    Key key,
    this.leading,
    this.title,
    this.actions,
    this.color,
    this.centerTitle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        leading: this.leading,
        title: this.title,
        actions: this.actions,
        centerTitle: this.centerTitle,
        backgroundColor: this.color,
        elevation: 0,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
