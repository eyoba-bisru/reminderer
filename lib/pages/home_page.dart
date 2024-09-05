import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _dateTime = DateTime.now();
  DateTime _time = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Save"),
                  ),
                ],
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Title",
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      maxLines: 8,
                      decoration: InputDecoration(
                        labelText: "Description",
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(""),
                    ElevatedButton(
                      onPressed: () async {
                        await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(
                            const Duration(days: 50),
                          ),
                        );
                        await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                      },
                      child: Text("Select Date and Time"),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: const Text("Reminderer"),
        centerTitle: true,
        actions: [
          _dateTime.day == DateTime.now().day
              ? const Text("Today")
              : Text('${_dateTime.day}/${_dateTime.month}/${_dateTime.year}'),
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
