import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constant.dart';

class AnimalDropDown extends StatefulWidget {
  const AnimalDropDown({Key? key}) : super(key: key);

  @override
  State<AnimalDropDown> createState() => _AnimalDropDownState();
}

class _AnimalDropDownState extends State<AnimalDropDown> {
  String? dropdownValue = 'Cows (Hayvanlar)';
  List<String> dropdownItem = <String>[
    'Cows (Hayvanlar)',
    'Insemination (Gebelik)',
    'Vaccination (Aşılama)',
    'Sick Animal (Hasta Hayvanlar)',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: kTextColor.withOpacity(0.32),
        ),
      ),
      child: DropdownButton<String>(
          value: dropdownValue,
          iconDisabledColor: kTextColor,
          iconEnabledColor: kPrimaryColor,
          isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down,
          ),
          iconSize: 30,
          elevation: 8,
          onChanged: (String? newValue) {
            setState(
                  () {
                dropdownValue = newValue;
              },
            );
          },
          items: dropdownItem.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(color: kTextColor),
              ),
            );
          }).toList()),
    );
  }
}
