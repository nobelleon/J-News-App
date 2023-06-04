import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Widget bangunWidgetLoading() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 25.0,
          width: 25.0,
          child: CupertinoActivityIndicator(),
        )
      ],
    ),
  );
}
