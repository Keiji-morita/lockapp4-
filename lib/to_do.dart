import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_picker/flutter_picker.dart';
class TodoAddPage extends StatefulWidget {
  @override
   TodoAddPageState createState() => TodoAddPageState();
}

class TodoAddPageState extends State<TodoAddPage> {
  var _mydatetime = new DateTime.now();
  // 日時を指定したフォーマットで指定するためのフォーマッター
  var formatter = new DateFormat('yyyy/MM/dd(E) HH:mm');
  //時間を取得
  var _datetime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
          children: [
             Text('時間□分の間\n画面をロックする',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 40)),
  OutlinedButton(
          child: const Text("時間設定"),
          style: OutlinedButton.styleFrom(
          primary: Colors.blue,
          shape: const StadiumBorder(),
          side: const BorderSide(color: Colors.blue),
  ),
  onPressed: () {
   Picker(
      adapter: DateTimePickerAdapter(type: PickerDateTimeType.kHMS, value: _datetime, customColumnType: [3, 4, 5]),
      title: Text("Select Time"),
      onConfirm: (Picker picker, List value) {
        setState(() => {_datetime = DateTime.utc(0, 0, 0, value[0], value[1], value[2])});
      },
    ).showModal(context);

  }
  
),
 OutlinedButton(
          child: const Text('スタート！'),
          style: OutlinedButton.styleFrom(
          primary: Colors.blue,
          shape: const StadiumBorder(),
          side: const BorderSide(color: Colors.blue),
  ),
  onPressed: () {},
),
 
 OutlinedButton(
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
           

          ],
        )
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
