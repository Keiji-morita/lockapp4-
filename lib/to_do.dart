import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class TodoAddPage extends StatefulWidget {
  @override
   TodoAddPageState createState() => TodoAddPageState();
}

class TodoAddPageState extends State<TodoAddPage> {
  var _mydatetime = new DateTime.now();
  // 日時を指定したフォーマットで指定するためのフォーマッター
  var formatter = new DateFormat('yyyy/MM/dd(E) HH:mm');

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
 DatePicker.showDateTimePicker(
             context,
             showTitleActions: true,
             // onChanged内の処理はDatepickerの選択に応じて毎回呼び出される
             onChanged: (date) {
                // print('change $date');
             }, 
             // onConfirm内の処理はDatepickerで選択完了後に呼び出される
             onConfirm: (date) {
               setState(() {
                 _mydatetime = date;
               });
             }, 
             // Datepickerのデフォルトで表示する日時
             currentTime: DateTime.now(), 
             // localによって色々な言語に対応
             //  locale: LocaleType.en
          );

  },
  
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
