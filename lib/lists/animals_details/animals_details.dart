import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constant.dart';

import '../animal_add/component/text_box_field.dart';
import 'component/animals_datails_card.dart';
import 'component/app_bar.dart';
import 'component/about_animal_card.dart';

class DetailAnimals extends StatelessWidget {
  const DetailAnimals(
      {Key? key,
      required this.animalName,
      required this.animalNumber,
      this.animal_id})
      : super(key: key);

  final String animalName;
  final String animalNumber;
  final int? animal_id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: detailsAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: kPrimaryColor,
                          width: 4.0,
                        ),
                      ),
                    ),
                    child: const Text(
                      "About the animal",
                      style: TextStyle(
                        color: kTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: AnimalsDetailsCard(
                animalName: animalName,
                animalNumber: animalNumber,
                animalID: animal_id,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: kPrimaryColor,
                          width: 4.0,
                        ),
                      ),
                    ),
                    child: const Text(
                      "Update Information",
                      style: TextStyle(
                          color: kTextColor, fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextBoxField(
                palceHolderText: "Animal Name",
                iconn: Icons.drive_file_rename_outline,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextBoxField(
                palceHolderText: "Animal Number",
                iconn: Icons.confirmation_num,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextBoxField(
                palceHolderText: "Birth",
                iconn: Icons.calendar_today,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextBoxField(
                palceHolderText: "Mother Number",
                iconn: Icons.confirmation_num,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextBoxField(
                palceHolderText: "Father Nnumber",
                iconn: Icons.confirmation_num,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            /* Row(children: const [
              Expanded(child: Padding(padding: EdgeInsets.all(2.0), child: UpdateButton()),),


            ],),*/
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
