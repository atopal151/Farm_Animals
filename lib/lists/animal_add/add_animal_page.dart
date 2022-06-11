import 'package:farm_animals/constant.dart';
import 'package:flutter/material.dart';
import '../../database_helper/database_helper.dart';
import '../../items/animalsItem.dart';
import 'component/add_app_bar.dart';

import 'component/dropdown_button_item.dart';
import 'component/text_box_field.dart';

class AddAnimalPage extends StatefulWidget {
  const AddAnimalPage({Key? key}) : super(key: key);

  @override
  State<AddAnimalPage> createState() => _AddAnimalPageState();
}

class _AddAnimalPageState extends State<AddAnimalPage> {
  var dbHelper = DatabaseHelper();
  late List animalsList;
  late AnimalsItem animal;
  int animalCount = 0;

  @override
  void initState() {
    // TODO: implement initState


    getAnimals();
  }

  Future<void> _updateUI() async {
    await dbHelper.getAnimalsItems();
    getAnimals();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AddAppBar(),
        backgroundColor: kTextWhiteColor,
        body: Column(
          children: [
            Expanded(
              flex: 9,
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextBoxField(
                        palceHolderText: "Animal Number",
                        iconn: Icons.confirmation_number,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextBoxField(
                        palceHolderText: "Animal Name",
                        iconn: Icons.drive_file_rename_outline,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextBoxField(
                        palceHolderText: "Birth",
                        iconn: Icons.date_range,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextBoxField(
                        palceHolderText: "Father Number",
                        iconn: Icons.confirmation_number,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextBoxField(
                        palceHolderText: "Mother Number",
                        iconn: Icons.confirmation_number,

                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: AnimalDropDown(),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: AnimalDropDown(),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: AnimalDropDown(),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: AnimalDropDown(),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: kPrimaryColor),
                  margin:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextButton(
                    onPressed: () async {
                      await dbHelper.insertAnimal(
                        AnimalsItem(animals_name: "ann", animals_number: "TR"),
                      );
                      _updateUI();
                    },
                    child: Text(
                      "Add Animal",
                      style: TextStyle(color: kTextWhiteColor),
                    ),
                  ),
                ))
          ],
        ));
  }

  void getAnimals() async {
    var animalFuture = dbHelper.getAnimalsItems();
    animalFuture.then((data) {
      setState(() {
        this.animalsList = data;
        animalCount = data.length;
      });
    });
  }
}

/*Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: kPrimaryColor),
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextButton(
        onPressed: () async {
          await dbHelper.insertAnimal(
            AnimalsItem(animals_name: "ann", animals_number: "TR"),
          );
          _updateUI();
        },
        child: Text(
          buttonText,
          style: TextStyle(color: kTextWhiteColor),
        ),
      ),
    );*/
