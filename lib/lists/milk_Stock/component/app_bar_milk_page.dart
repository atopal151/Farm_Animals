import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constant.dart';

AppBar MilkStockAppBar (BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,

    title: Container(
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(
            color: kPrimaryColor,
            width: 3.0,
          ),
        ),
      ),
      child: RichText(
        text: TextSpan(
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(fontWeight: FontWeight.bold),
          children: const [
            TextSpan(
              text: " Milk ",
              style: TextStyle(color: kTextColor),
            ),
            TextSpan(
              text: "Stock  ",
              style: TextStyle(color: kPrimaryColor),
            ),
          ],
        ),
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: SvgPicture.asset("assets/icons/notification.svg"),
        onPressed: () {},
      ),
    ],
  );
}
