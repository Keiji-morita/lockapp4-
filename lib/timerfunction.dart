import 'package:flutter/material.dart';
import 'package:slide_countdown/slide_countdown.dart';

void main() {
  runApp(TimerFunction());
}

class TimerFunction extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ExampleSlideCountdown(),
    );
  }
}

const defaultDuration = Duration(hours: 2, minutes: 30);
const defaultPadding = EdgeInsets.symmetric(horizontal: 10, vertical: 5);

class ExampleSlideCountdown extends StatelessWidget {
  const ExampleSlideCountdown({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
              
            
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: Text('残り時間\nあと',
                           style: TextStyle(fontSize: 30),
                           ),
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
         


          ],
        ),
      ),
    );
  }
}
