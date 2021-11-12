import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_picker/flutter_picker.dart';

class TodoAddPage extends StatefulWidget {
  @override
   TodoAddPageState createState() => TodoAddPageState();
}

class TodoAddPageState extends State<TodoAddPage> {
  int _mydatetime;

  // 日時を指定したフォーマットで指定するためのフォーマッター
  
  //時間を取得
  var _datetime;
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             Text(_datetime,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 40)),
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
   Picker(
      adapter: DateTimePickerAdapter(type: PickerDateTimeType.kHMS, value: _datetime, customColumnType: [3, 4, 5]),
      title: Text("時間指定"),
      onConfirm: (Picker picker, List value) {
        setState(() => {_datetime = DateTime.utc(0, 0, 0, value[0], value[1], value[2])});
      },
      
    ).showModal(context);
  }
  
),
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
  onPressed: () {},
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
        )
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
