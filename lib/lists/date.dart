import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  DateTime _dateTime = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();

  Future _selectdata(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(2016),
        lastDate: DateTime(2019));
    if (picked != null && picked != _dateTime) {
      print('Date Selected:${_dateTime.toString()}');
      setState(() {
        _dateTime = picked;
      });
    }
  }

  Future _selecttime(BuildContext context) async {
    final TimeOfDay? timeOfDay =
    await showTimePicker(context: context, initialTime: _time);
    if (timeOfDay != null && timeOfDay != true) {
      print("Time Selected ${_time.toString()}");
      setState(() {
        _time = timeOfDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("date"),
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Text("asfasfa ${_dateTime.toString()}"),
            RaisedButton(
              onPressed: (){_selectdata(context);},
              child: const Text("date Picker"),
            )
          ],
        ),
      ),
    );
  }
}
