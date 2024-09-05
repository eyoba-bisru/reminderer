import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reminderer"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              var date = await showDatePicker(
                context: context,
                initialDate: _dateTime,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(
                  Duration(
                    days: 50,
                  ),
                ),
              );

              if (date == null) return;

              setState(() {
                _dateTime = date;
              });
            },
            icon: const Icon(
              Icons.date_range,
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(_dateTime.toString()),
      ),
    );
  }
}
