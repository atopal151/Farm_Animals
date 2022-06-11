import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constant.dart';

class ItemAboutCard extends StatelessWidget {
  const ItemAboutCard({
    Key? key,
    required this.animalinfo,
    required this.animaltitle,
  }) : super(key: key);

  final String animalinfo;
  final String animaltitle;

  @override
  Widget build(BuildContext context) {
    // This size provide you the total height and width of the screen
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
      border: Border.all(
          color: ksecondaryColor, //.withOpacity(0.32),
        ),
        boxShadow: [
          BoxShadow(
            color: ksecondaryColor.withOpacity(0.7),

            blurRadius: 7,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
        color: kTextWhiteColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              animaltitle + ": " + animalinfo,
              style: const TextStyle(
                  color: kTextColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w900),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                animaltitle,
                style: const TextStyle(
                    color: kTextColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                animalinfo,
                style: const TextStyle(
                    color: kTextColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w900),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                animaltitle,
                style: const TextStyle(
                    color: kTextColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                animalinfo,
                style: const TextStyle(
                    color: kTextColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w900),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                animaltitle,
                style: const TextStyle(
                    color: kTextColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                animalinfo,
                style: const TextStyle(
                    color: kTextColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w900),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                animaltitle,
                style: const TextStyle(
                    color: kTextColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                animalinfo,
                style: const TextStyle(
                    color: kTextColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w900),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                animaltitle,
                style: const TextStyle(
                    color: kTextColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                animalinfo,
                style: const TextStyle(
                    color: kTextColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w900),
              ),
            ],
          ),

          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
