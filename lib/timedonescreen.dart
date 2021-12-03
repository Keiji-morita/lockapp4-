import 'package:flutter/material.dart';
import 'package:lockapp4/main.dart';



class Timedonescreen extends StatefulWidget {
  @override
   TimedonescreenState createState() => TimedonescreenState();
}

class TimedonescreenState extends State<Timedonescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
         child:Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
           const Padding(
              padding: EdgeInsets.only(top: 80, bottom: 10),
              child: Text('🎉終了！よく頑張った！🎉',
              style: TextStyle(fontSize: 30),),
            ),
          
        
            SizedBox(
                width: 200,
                height: 50,
                child: OutlinedButton(
                  child: const Text('home'),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.red,
                    shape: const StadiumBorder(),
                    side: const BorderSide(color: Colors.red),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyTodoApp()));
                  },
                ),
                ),
          ],
        )
       ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}