import 'package:flutter/material.dart';
import 'package:lockapp4/timedonescreen.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'dart:async';

class TimerFunction extends StatefulWidget {
  
  @override
  TimerFunctionState createState() => TimerFunctionState();
   TimerFunction(this.selectNumber, this.selectNumber_1, this.selectNumber_2);
  final  selectNumber;
  final  selectNumber_1;
  final  selectNumber_2;
}



const defaultDuration = Duration(hours: 1,minutes: 0, seconds:10); 
const defaultPadding = EdgeInsets.symmetric(horizontal: 10, vertical: 5);

class TimerFunctionState extends State<TimerFunction> {

  

  @override
  Widget build(BuildContext context) {

    //タイマー記述分？
Future.delayed(Duration(hours: int.parse(widget.selectNumber),
minutes: int.parse(widget.selectNumber_1) ), (


) {
    

             });
    
    
    
    //戻る処理の記述分
     Future.delayed(Duration(hours: int.parse(widget.selectNumber),minutes: 
int.parse(widget.selectNumber_1)), () {
             Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Timedonescreen()));
                  });
   
      return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
            
           Text("${widget.selectNumber}時間${widget.selectNumber_1}分"),
        
        SizedBox(
            width: 200,
            height: 50,
            
                child: const Text("残り時間\nあと"),
               
       ),

            
            const SlideCountdownSeparated(
              duration: defaultDuration,
              padding: defaultPadding,
            ),
            
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: Text('🔥集中しよう！！🔥',
              style: TextStyle(fontSize: 30),),
            ),
            
             const Padding(
               padding: EdgeInsets.only(top: 20, bottom: 10),
              )
            
          
        ],
        
      )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


