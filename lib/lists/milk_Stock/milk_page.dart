import 'package:farm_animals/constant.dart';
import 'package:farm_animals/items/milkstockItem.dart';
import 'package:farm_animals/lists/charts/charts.dart';
import 'package:flutter/material.dart';

import '../../database_helper/database_helper.dart';
import 'component/app_bar_milk_page.dart';

class MilkStock extends StatefulWidget {
  const MilkStock({Key? key}) : super(key: key);

  @override
  State<MilkStock> createState() => _MilkStockState();
}

class _MilkStockState extends State<MilkStock> {
  var dbHelper = DatabaseHelper();
  late List milkList;
  late MilkItem milk;
  int milkCount = 0;

  @override
  void initState() {
    getMilk();
  }

  Future<void> _updateUI() async {
    await dbHelper.getMilkItems();
    getMilk();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MilkStockAppBar(context),
      backgroundColor: kTextWhiteColor,
      body: Column(
        children: [
          Expanded(flex:2,child: ChartsScreen()),
          Expanded(flex:3 ,child: buildMilkList()),
        ],
      ),
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  ListView buildMilkList() {
    return ListView.builder(
      itemCount: milkCount,
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
                        await dbHelper.updateMilk(MilkItem.withId(
                            milk_id: milkList[position].milk_id,
                            liter: "100",
                            milking_date: "12.12.2021",
                            animal_how: "2"));
                        _updateUI();
                      },
                    ),
                    title: Row(
                      children: [
                        Text(
                          "Liter:" + milkList[position].liter,
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
                          "ID:" + milkList[position].milk_id.toString(),
                          style: const TextStyle(
                              color: kTextWhiteColor, fontSize: 17),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Animal How:" +
                              milkList[position].animal_how.toString(),
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
                        await dbHelper.deleteMilk(
                            MilkItem(milk_id: milkList[position].milk_id));
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

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () async {
        await dbHelper.insertMilk(
          MilkItem(
            liter: "50",
            milking_date: "01.01.2022",
            animal_how: "5",
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

  void getMilk() async {
    var milkFuture = dbHelper.getMilkItems();
    milkFuture.then((data) {
      setState(() {
        this.milkList = data;
        milkCount = data.length;
      });
    });
  }
}
