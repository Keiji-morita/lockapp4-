import 'package:flutter/material.dart';
import 'package:flutter_my_picker/flutter_my_picker.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:f_datetimerangepicker/f_datetimerangepicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:time_range_picker/time_range_picker.dart';
import 'package:lockapp4/whenStartEnd.dart' ;





void main() => runApp(Decidedatetime());

class Decidedatetime extends StatefulWidget {
  @override
  _DecidedatetimeState createState() => _DecidedatetimeState();
  
}

class _DecidedatetimeState extends State<Decidedatetime> {
  // 入力されたテキストをデータとして持つ
  String _text = '';

//曜日の定義
final weekDays = <String>[
      '日',
      '月',
      '火',
      '水',
      '木',
      '金',
      '土',
     ];

  

  String selectWeekDay = '';

void _cupertinoPicker() {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Container(
	  //Pickerの高さを指定。指定しない場合はフルスクリーン。
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
                  child: CupertinoPicker(
		 // ループさせるかどうか
                    looping: true,
		 // Pickerのそれぞれの高さ
                    itemExtent: 30,
		//先程作成したweekDaysリストをText Widgetに変換して読み込み。
                    children: weekDays.map((weekDay) => new Text(weekDay)).toList(),
		//Pickerの操作を行う度に呼び出し。
		//selectWeekDayに選択したweekDaysを代入。
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectWeekDay = weekDays[index];
                      });
                    },

                  ),
                ),
              ],
            ),
          );
        });


  }
 // データを元に表示するWidget
  @override
  Widget build(BuildContext context) {
  var result;
    var children2 = <Widget>[
      //曜日設定
           Container(
              width: double.infinity,
              height: 60,
              child: Row(
                // 均等配置
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                            SizedBox(
            width: 80,
            height: 40,
            //曜日設定ボタン
            child: TextButton(
                child: const Text("曜日"),
                
                onPressed: () {
                  _cupertinoPicker();
                }),
          ),
                  Container( child: Text('${selectWeekDay}曜日')),
                  
                ],
              ),
            ),


           
           Container(
              width: double.infinity,
              height: 60,
              child: Row(
                // 均等配置
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                          TextButton(
            onPressed: () async {
              TimeRange result = await showTimeRangePicker(
                context: context,
              );
              print("result " + result.toString());
            },
            child: Text("時間設定"),
          ),

          Container(
              child: Text('${result.toString()}'),
              ),
          
         
          
                  
                ],
              ),
            ),

            
            
            Container(
              // 横幅いっぱいに広げる
              width: double.infinity,
              // リスト追加ボタン
              child: ElevatedButton(
                onPressed: () {
                  // "pop"で前の画面に戻る
                  // "pop"の引数から前の画面にデータを渡す
                  Navigator.of(context).pop(_text);
                },
                child: Text('スケジュールを追加', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              // 横幅いっぱいに広げる
              width: double.infinity,
              // キャンセルボタン
              child: TextButton(
                // ボタンをクリックした時の処理
                onPressed: () {
                  // "pop"で前の画面に戻る
                  Navigator.of(context).pop();
                },
                child: Text('キャンセル'),
              ),
            ),
          ];
    return Scaffold(
      appBar: AppBar(
        title: Text('時間と曜日を決める'),
      ),
      
    

      body: Container(
        // 余白を付ける
        padding: EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children2,
        ),
      ),
    );
  }
}