import 'package:flutter/material.dart';

import 'package:time_range_picker/time_range_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MadeSchedule(),
    );
  }
}

class MadeSchedule extends StatefulWidget {
  MadeSchedule({Key? key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String? title;

  @override
  _MadeScheduleState createState() => _MadeScheduleState();
}

class _MadeScheduleState extends State<MadeSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: ListView(children: [
        ElevatedButton(
          onPressed: () async {
            TimeRange? result = await showTimeRangePicker(
              context: context,
            );

            print("result " + result.toString());
          },
          child: Text("Pure"),
        ),

       ]
     )
    ); 
  }
}