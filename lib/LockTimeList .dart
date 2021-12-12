import 'package:flutter/material.dart';
import 'package:lockapp4/main.dart';
import 'package:lockapp4/decideschedule.dart' show Decidedatetime;


void main() => runApp(DateScheduleList());

class TimeTables extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 右上に表示される"debug"ラベルを消す
      debugShowCheckedModeBanner: false,
      // アプリ名
      title: 'My Todo App',
      theme: ThemeData(
        // テーマカラー
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // リスト一覧画面を表示
      home: DateScheduleList(),
      
    );
  }
}



// リスト一覧画面用Widget
class DateScheduleList extends StatefulWidget {
  @override
  _DateScheduleListState createState() => _DateScheduleListState();
  
}

class _DateScheduleListState extends State<DateScheduleList> {
  // Todoリストのデータ
  List<String> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
               leading: new IconButton(
               icon: new Icon(Icons.arrow_back, color: Colors.black),
               onPressed: () => Navigator.of(context).pop(),
              ), 
              title: Text("ロックスケジュール設定"),
              centerTitle: true,
            ),

      // データを元にListViewを作成
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(todoList[index]),
            ),
          );
        },
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // "push"で新規画面に遷移
          // リスト追加画面から渡される値を受け取る
          final newListText = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              
              return Decidedatetime();
            }),
          );
          if (newListText != null) {
            // キャンセルした場合は newListText が null となるので注意
            setState(() {
              // リスト追加
              todoList.add(newListText);
            });
          }
        },
        child: Icon(Icons.add),
      ),

     
    
       
    );
  }
}

