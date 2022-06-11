import 'package:farm_animals/constant.dart';
import 'package:farm_animals/items/animalsItem.dart';
import 'package:farm_animals/lists/animal_add/add_animal_page.dart';
import 'package:farm_animals/lists/charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../component/search_box.dart';
import '../../database_helper/database_helper.dart';
import '../animals_details/animals_details.dart';
import '../date.dart';
import 'component/app_bar.dart';

class AnimalsList extends StatefulWidget {
  const AnimalsList({Key? key}) : super(key: key);

  @override
  State<AnimalsList> createState() => _AnimalsListState();
}

class _AnimalsListState extends State<AnimalsList> {
  var dbHelper = DatabaseHelper();
  late List animalsList;
  late AnimalsItem animal;
  int animalCount = 0;

  @override
  void initState() {
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
      backgroundColor: kTextWhiteColor,
      appBar: AnimalAppBar(context),
      body: Column(
        children: [
          const Expanded(flex: 2, child: ChartsScreen()),
          Row(
            children: [
              const Expanded(
                flex: 2,
                child: SearchBox(),
              ),
              Expanded(
                flex: 1,
                child: Container(

                    margin:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                    decoration: BoxDecoration(
                      color: kTextWhiteColor,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: ksecondaryColor, //.withOpacity(0.32),
                      ),
                    ),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              this.context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const AddAnimalPage();
                                },
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.add,
                            size: 26,
                            color: kPrimaryColor,
                          ),
                        ),

                      ],
                    )),
              ),
            ],
          ),
          Expanded(flex: 2, child: buildAnimalList()),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  ListView buildAnimalList() {
    return ListView.builder(
      itemCount: animalCount,
      itemBuilder: (BuildContext context, int position) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: ksecondaryColor.withOpacity(0.4),
                      blurRadius: 8,
                      offset: const Offset(0, 5), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/farms.jpg"),
                  ),
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(colors: [
                        const Color(0xffff961f).withOpacity(0.5),
                        kPrimaryColor.withOpacity(0.5)
                      ])),
                  child: ListTile(
                    leading: IconButton(
                      icon: const Icon(
                        Icons.check_box_outline_blank,
                        color: kTextWhiteColor,
                      ),
                      onPressed: () async {
                        await dbHelper.updateAnimal(AnimalsItem.withId(
                            anl_id: animalsList[position].anl_id,
                            animals_name: "anlName",
                            animals_number: "Tr64000"));
                        _updateUI();
                      },
                    ),
                    title: Row(
                      children: [
                        Text(
                          "Id:" + animalsList[position].anl_id.toString(),
                          style: const TextStyle(
                            color: kTextWhiteColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Name:" + animalsList[position].animals_name,
                          style: const TextStyle(
                            color: kTextWhiteColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          "Number:" + animalsList[position].animals_number,
                          style: const TextStyle(
                            color: kTextWhiteColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: kTextWhiteColor,
                      ),
                      onPressed: () async {
                        await dbHelper.deleteAnimal(
                            AnimalsItem(anl_id: animalsList[position].anl_id));
                        _updateUI();
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        this.context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DetailAnimals(
                              animalName: animalsList[position].animals_name,
                              animalNumber:
                                  animalsList[position].animals_number,
                              animal_id: animalsList[position].anl_id,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () async {
        await dbHelper.insertAnimal(
          AnimalsItem(animals_name: "ann", animals_number: "TR"),
        );
        _updateUI();
      },
      backgroundColor: kTextWhiteColor,
      child: const Icon(
        Icons.add,
        color: kPrimaryColor,
      ),
    );
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
