import 'package:flutter/material.dart';

import '../../../constant.dart';

class AnimalsDetailsCard extends StatelessWidget {
  const AnimalsDetailsCard(
      {Key? key,
      required this.animalName,
      required this.animalNumber,
      this.animalID})
      : super(key: key);
  final String animalName;
  final String animalNumber;
  final int? animalID;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ksecondaryColor.withOpacity(0.2),
            blurRadius: 7,
            offset: const Offset(0, 5), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/cows.jpg"),
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              const Color(0xffff961f).withOpacity(0.9),
              kPrimaryColor.withOpacity(0.9)
            ])),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: Text(
              "Name: " + animalName,
              style: const TextStyle(
                  color: kTextWhiteColor,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            )),
            Expanded(
                child: Text(
              "Number: " + animalNumber,
              style: const TextStyle(
                  color: kTextWhiteColor,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ))
          ],
        ),
      ),
    );
  }
}
