import 'package:farm_animals/lists/charts/charts.dart';
import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../database_helper/database_helper.dart';
import '../../items/todo_item.dart';
import 'component/app_bar.dart';

class ExampleList extends StatefulWidget {
  const ExampleList({Key? key}) : super(key: key);

  @override
  State<ExampleList> createState() => _ExampleListState();
}

class _ExampleListState extends State<ExampleList> {
  var dbHelper = DatabaseHelper();
  late List todosList;
  late TodoItem todo;
  int todoCount = 0;

  @override
  void initState() {
    getTodos();
  }

  Future<void> _updateUI() async {
    await dbHelper.getTodoItems();
    getTodos();
    setState(() {});
  }

//-----------------------------------end-----------------------------------------

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GainAppBar(context),
      body: Column(
        children: [
          Expanded(flex: 2, child: ChartsScreen()),
          Expanded(flex: 3, child: buildGainList()),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  ListView buildGainList() {
    return ListView.builder(
      itemCount: todoCount,
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
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/farms.jpg"),
                  ),
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [
                        const Color(0xffff961f).withOpacity(0.7),
                        kPrimaryColor.withOpacity(0.5)
                      ])),
                  child: ListTile(
                    leading: IconButton(
                      icon: const Icon(
                        Icons.check_box_outline_blank,
                        color: kTextWhiteColor,
                      ),
                      onPressed: () async {
                        await dbHelper.updateTodo(TodoItem.withId(
                            id: todosList[position].id,
                            content: "ooo",
                            createdAt: 2,
                            isDone: 2));
                        _updateUI();
                      },
                    ),
                    title: Row(
                      children: [
                        Text(
                          "Cont:" + todosList[position].content,
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
                          "isDone:" + todosList[position].isDone.toString(),
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
                          "ID:" + todosList[position].id.toString(),
                          style: const TextStyle(
                              color: kTextWhiteColor, fontSize: 17),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "CreatedAt:" +
                              todosList[position].createdAt.toString(),
                          style: const TextStyle(
                              color: kTextWhiteColor, fontSize: 17),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: kTextWhiteColor,
                      ),
                      onPressed: () async {
                        await dbHelper
                            .deleteTodo(TodoItem(id: todosList[position].id));
                        _updateUI();
                      },
                    ),
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
        await dbHelper.insertTodo(
          TodoItem(
            content: "asdag",
            createdAt: 1,
            isDone: 1,
          ),
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

  void getTodos() async {
    var todosFuture = dbHelper.getTodoItems();
    todosFuture.then((data) {
      setState(() {
        this.todosList = data;
        todoCount = data.length;
      });
    });
  }
}
