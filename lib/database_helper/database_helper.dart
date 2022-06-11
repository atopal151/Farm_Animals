// ignore_for_file: avoid_print

import 'dart:async';
import 'package:farm_animals/items/animalsItem.dart';
import 'package:farm_animals/items/milkstockItem.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../items/todo_item.dart';

class DatabaseHelper {
  late Database _db;

  /////////////////-------------database start -----------------/////////////////

  Future<Database> get db async {
    print("db burada 1");
    _db = await initializeDb();
    print("db burada 3");
    return _db;
  }

  /////////////----------Create Database---------------/////////////////

  Future<Database> initializeDb() async {
    print("init burada 1");
    String dbPath = join(await getDatabasesPath(), "farm.db");
    var eTradeDb = await openDatabase(dbPath, version: 1, onCreate: createDb);
    return eTradeDb;
  }

  FutureOr<void> createDb(Database db, int version) async {
    await db.execute(
        "CREATE TABLE example (id INTEGER PRIMARY KEY, isDone BIT NOT NULL, content TEXT, createdAt INT)");
    await db.execute(
        'CREATE TABLE animals (anl_id	INTEGER PRIMARY KEY, animals_number	TEXT, animals_name	TEXT)');
    await db.execute(
        'CREATE TABLE milk (milk_id	INTEGER PRIMARY KEY, liter	TEXT, milking_date	TEXT, animal_how	TEXT)');
  }

//////////////////////////////   Example TODOList   //////////////////////////



  //-------------getTodo data------------------------------//
  Future<List> getTodoItems() async {
    print("getdata burada 1");
    Database db = await this.db;
    print("getdata burada 2");
    var result = await db.query("example");
    return List.generate(result.length, (i) {
      return TodoItem.fromObject(result[i]);
    });
  }

  //-------------addTodo data-----------------------------//
  Future<int> insertTodo(TodoItem todo) async {
    print("insert 1");
    Database db = await this.db;
    print("insert 2");
    var result = await db.insert("example", todo.toMap());
    print("insert 3");
    return result;
  }

  //--------------deleteTodo data-------------------------//
  Future<int> deleteTodo(TodoItem todo) async {
    print("delete 1");
    Database db = await this.db;
    print("delete 2");
    var result = await db.rawDelete("DELETE FROM example WHERE id=${todo.id}");
    print("delete 3 ${todo.id}");
    return result;
  }

  //--------------------updateTodo data-----------------//
  Future<int> updateTodo(TodoItem todo) async {
    print("update 1 ${todo.id}");
    Database db = await this.db;
    print("update 2 ${todo.id}");
    var result = await db
        .update("example", todo.toMap(), where: "id=?", whereArgs: [todo.id]);
    print("update 3 ");
    return result;
  }



  /*---------------------------Todolist End---------------------------------*/

///////////////////////////////  Animals Database  ////////////////////////////

//-------------getAnimals------------------------------//
  Future<List> getAnimalsItems() async {
    print("getdata animals burada 1");
    Database db = await this.db;
    print("getdata animals burada 2");
    var result = await db.query("animals");
    return List.generate(result.length, (i) {
      return AnimalsItem.fromObject(result[i]);
    });
  }

//-------------AddAnimal-----------------------------//
  Future<int> insertAnimal(AnimalsItem animal) async {
    print("insert animal 1");
    Database db = await this.db;
    print("insert animal 2");
    var result = await db.insert("animals", animal.toMap());
    print("insert animal 3");
    return result;
  }

//--------------DeleteAnimal-------------------------//
  Future<int> deleteAnimal(AnimalsItem animal) async {
    print("delete animal 1");
    Database db = await this.db;
    print("delete animal 2");
    var result = await db.rawDelete("DELETE FROM animals WHERE anl_id=${animal.anl_id}");
    print("delete animal 3 ${animal.anl_id}");
    return result;
  }

//--------------------UpdateAnimal-----------------//
  Future<int> updateAnimal(AnimalsItem animal) async {
    print("update animal 1 ${animal.anl_id}");
    Database db = await this.db;
    print("update animal 2 ${animal.anl_id}");
    var result = await db
        .update("animals", animal.toMap(), where: "anl_id=?", whereArgs: [animal.anl_id]);
    print("update animal 3 ");
    return result;
  }

/*------------------------------Animals End----------------------------------*/



//////////////////////////////   Example TODOList   //////////////////////////

//-------------MilkStock data------------------------------//
  Future<List> getMilkItems() async {
    print("GetMilk burada 1");
    Database db = await this.db;
    print("GetMilk burada 2");
    var result = await db.query("milk");
    return List.generate(result.length, (i) {
      return MilkItem.fromObject(result[i]);
    });
  }

//-------------addMilk data-----------------------------//
  Future<int> insertMilk(MilkItem milk) async {
    print("insertMilk 1");
    Database db = await this.db;
    print("insertMilk 2");
    var result = await db.insert("milk", milk.toMap());
    print("insertMilk 3");
    return result;
  }

//--------------deleteMilk data-------------------------//
  Future<int> deleteMilk(MilkItem milk) async {
    print("delete 1");
    Database db = await this.db;
    print("delete 2");
    var result = await db.rawDelete("DELETE FROM milk WHERE milk_id=${milk.milk_id}");
    print("delete 3 ${milk.milk_id}");
    return result;
  }

//--------------------updateMilk data-----------------//
  Future<int> updateMilk(MilkItem milk) async {
    print("updateMilk 1 ${milk.milk_id}");
    Database db = await this.db;
    print("updateMilk 2 ${milk.milk_id}");
    var result = await db
        .update("milk", milk.toMap(), where: "milk_id=?", whereArgs: [milk.milk_id]);
    print("updateMilk 3 ");
    return result;
  }

/*---------------------------Todolist End---------------------------------*/

}



