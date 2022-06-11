import 'package:farm_animals/lists/animal/animals_list.dart';
import 'package:flutter/material.dart';

import 'lists/example/example_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("..."),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 350,
                color: Colors.blue,
                child: TextButton(
                  child: const Text(
                    "Sqflite Example",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExampleList()),
                    );
                  },
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: 350,
                color: Colors.blue,
                child: TextButton(
                  child: const Text(
                    "Animals Example",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AnimalsList()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
