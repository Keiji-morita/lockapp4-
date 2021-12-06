import 'package:flutter/material.dart';

import 'package:lockapp4/decidetime.dart';

void main() {
  // 最初に表示するWidget
  runApp(MyTodoApp());
}

class MyTodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoListPage(),
    );
  }
}

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              SizedBox(
                width: 200,
                height: 50,
                child: OutlinedButton(
                  child: const Text('今すぐ画面をロック'),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.red,
                    shape: const StadiumBorder(),
                    side: const BorderSide(color: Colors.red),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TodoAddPage()));
                  },
                ),
              ),
                SizedBox(
                width: 200,
                height: 50,
                child: OutlinedButton(
                  child: const Text('時間を決めてロック'),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.blue,
                    shape: const StadiumBorder(),
                    side: const BorderSide(color: Colors.blue),
                  ),
                  onPressed: () {
                    
                  },
                ),
                ),
              ]),
        ),
      ),
    );
  }
}
