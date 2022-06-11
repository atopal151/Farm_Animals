import 'dart:async';

import 'package:flutter/material.dart';

import '../../../constant.dart';

class TextBoxField extends StatelessWidget {
  const TextBoxField({Key? key, required this.palceHolderText, this.iconn,})
      : super(key: key);

  final String palceHolderText;
  final IconData? iconn;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: kTextColor.withOpacity(0.32),
        ),
      ),
      child: TextField(
        style: const TextStyle(color: kTextColor),
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
            border: InputBorder.none,
            labelText: palceHolderText,
            labelStyle: const TextStyle(color: kTextLightColor),
            /*prefixIcon: Icon(
              Icons.security,
              color: kPrimaryColor,
            ),*/
            suffixIcon: IconButton(
              icon: Icon(
                iconn,
                color: kPrimaryColor,
              ),
              onPressed: () {},
            )
            ),

      ),
    );
  }
}
