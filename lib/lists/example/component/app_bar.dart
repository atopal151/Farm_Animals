import 'package:flutter/material.dart';
import '../../../constant.dart';

AppBar GainAppBar(BuildContext context) {
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
              text: " Gain",
              style: TextStyle(color: kTextColor),
            ),
            TextSpan(
              text: " Page  ",
              style: TextStyle(color: kPrimaryColor),
            ),
          ],
        ),
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.account_balance_wallet,color: kPrimaryColor,),
        onPressed: () {},
      ),
    ],
  );
}
