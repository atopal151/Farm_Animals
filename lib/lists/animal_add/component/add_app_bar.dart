import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constant.dart';

AppBar AddAppBar() {
  return AppBar(
    foregroundColor: kPrimaryColor,
    backgroundColor: kTextWhiteColor,
    elevation: 0,
    title: Row(
      children: [
        Text(
          "Add",
          style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
        ),
        Text(
          " Animal",
          style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
        ),
      ],
    ),
    actions: <Widget>[],
  );
}
