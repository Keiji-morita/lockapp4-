import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:lockapp4/timerfunction.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(TodoAddPage());

class TodoAddPage extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }

  TodoAddPageState createState() => TodoAddPageState();
}

class TodoAddPageState extends State<TodoAddPage> {
  final numbars = List<String>.generate(9, (index) => '$index');
  final numbars_1 = List<String>.generate(60, (indexs) => '$indexs');
  
// ↓にPickerで選択したアイテムが代入される予定です。
  String selectNumber = '0';
  String selectNumber_1 = '0';
  String selectNumber_2 = "0";

  void _cupertinoPicker() {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Container(
            height: 250,
            color: Colors.white,
            child: Column(
              children: [
                TextButton(
                  child: const Text('閉じる'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                const Divider(),
                Expanded(
                  child: Row(
                    children: [
                      //時間設定
                      Expanded(
                        child: CupertinoPicker(
                          itemExtent: 30,
                          scrollController:
                              FixedExtentScrollController(initialItem: 0),
                          onSelectedItemChanged: (index) {
                            setState(() {
                              selectNumber = numbars[index];
                            });
                          },
                          children: numbars
                              .map((numbar) => new Text(numbar))
                              .toList(),
                        ),
                      ),
                      Expanded(
                        child: CupertinoPicker(
                          itemExtent: 30,
                          scrollController:
                              FixedExtentScrollController(initialItem: 0),
                          onSelectedItemChanged: (index) {
                            setState(() {
                              selectNumber_1 = numbars_1[index];
                            });
                          },
                          children: numbars_1
                              .map((minutes) => new Text(minutes))
                              .toList(),
                        ),
                      ),
                      Expanded(
                        child: CupertinoPicker(
                          itemExtent: 30,
                          scrollController:
                              FixedExtentScrollController(initialItem: 0),
                          onSelectedItemChanged: (index) {
                            setState(() {
                              [index];
                            });
                          },
                          children: numbars_1
                              .map((seconds) => new Text(seconds))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  // 日時を指定したフォーマットで指定するためのフォーマッター

  //時間を取得
  var _datetime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('${selectNumber}時間${selectNumber_1}分',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
          Text('　　　の間\n画面をロックする',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
          SizedBox(
            width: 200,
            height: 50,
            child: OutlinedButton(
                child: const Text("時間設定"),
                style: OutlinedButton.styleFrom(
                  primary: Colors.green,
                  shape: const StadiumBorder(),
                  side: const BorderSide(color: Colors.green),
                ),
                onPressed: () {
                  _cupertinoPicker();
                }),
          ),
          SizedBox(
            width: 200,
            height: 50,
            child: OutlinedButton(
              child: const Text('スタート！'),
              style: OutlinedButton.styleFrom(
                primary: Colors.blue,
                shape: const StadiumBorder(),
                side: const BorderSide(color: Colors.blue),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TimerFunction(
                            selectNumber, selectNumber_1, selectNumber_2)));
              },
            ),
          ),
          SizedBox(
            width: 200,
            height: 50,
            child: OutlinedButton(
              child: const Text('キャンセル'),
              style: OutlinedButton.styleFrom(
                primary: Colors.red,
                shape: const StadiumBorder(),
                side: const BorderSide(color: Colors.red),
              ),
              // ボタンをクリックした時の処理
              onPressed: () {
                // "pop"で前の画面に戻る
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

