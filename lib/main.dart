import 'package:flutter/material.dart';

void main() {
  // 最初に表示するWidget
  runApp(MyTodoApp());
}k

class MyTodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // アプリ名
      title: 'My Todo App',
      theme: ThemeData(
        // テーマカラー
        primarySwatch: Colors.blue,
      ),
      // リスト一覧画面を表示
      home: TodoListPage(),
    );
  }
}

// ロック種別選択画面
class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center( 
     child:Container(
      child: Column(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children :<Widget>[
          OutlinedButton(
          child: const Text('今すぐ画面をロック'),
          style: OutlinedButton.styleFrom(
          primary: Colors.red,
          shape: const StadiumBorder(),
          side: const BorderSide(color: Colors.red),
  ),
  onPressed: () {
             Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              // 遷移先の画面としてリスト追加画面を指定
              return TodoAddPage();
            }),
          );
  },
),
         OutlinedButton(
          child: const Text('時間を決めてロック'),
          style: OutlinedButton.styleFrom(
          primary: Colors.blue,
          shape: const StadiumBorder(),
          side: const BorderSide(color: Colors.blue),
  ),
  onPressed: () {},
),
        ]
),
     ), 
    ),
    );
  }
}

// 時間設定画面（今すぐ画面をロック）
class TodoAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Container(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

 Text('□時間□分の間\n画面をロックする',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 40)),
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
     ),
    ),
    
    ),
  );
}
}
