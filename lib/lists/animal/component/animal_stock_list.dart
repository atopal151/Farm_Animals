import 'package:farm_animals/lists/animal/component/animalstock.dart';
import 'package:flutter/material.dart';

class AnimalStockList extends StatelessWidget {
  const AnimalStockList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          AnimalStockCard(
              title: "Cows",
              shopName: "aaa",
              svgSrc: "assets/icons/burger_beer.svg",
              press: () {}),
        ],
      ),
    );
  }
}
