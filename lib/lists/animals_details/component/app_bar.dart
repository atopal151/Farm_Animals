import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constant.dart';

AppBar detailsAppBar() {
  return AppBar(
    foregroundColor: kTextColor,
    backgroundColor: kTextWhiteColor,
    elevation: 0,
    title: Row(
      children: const [
        Text(
          "Animals",
          style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
        ),
        Text(
          " Details",
          style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
        ),
      ],
    ),
    actions: <Widget>[],
  );
}


/* AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          "Farm Asistant",
          speed: Duration(milliseconds: 150),
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
      isRepeatingAnimation: true,
      repeatForever: true,
      displayFullTextOnTap: true,
      stopPauseOnTap: false,
    ),

    */