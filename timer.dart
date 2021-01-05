import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Pomodoro extends StatefulWidget {
  @override
  _PomodoroState createState() => _PomodoroState();
}

class _PomodoroState extends State<Pomodoro>{
  bool works = false;
  double percent = 0;
  static int Working = 25;

  int Time = Working * 60;
  int Seconds = 0;
  Timer timer;
  bool a = true;
  String b = "Stop Timer";
  String c = "blue";

  _StartTimer(){
    double SecPercent = (Time/100);
    works = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(Seconds == 0){
        Working--;
      }
      setState(() {
        if(Time > 0){
          Time--;
          Seconds = Time % 60;

          if(Time % SecPercent == 0){
            if(percent < 1){
              percent += 0.01;
            }
            else {
              percent = 1;
            }
          }
        }
        else {
          percent = 0;
          Working = 25;
          timer.cancel();
        }
      });
    });
  }

  _StopTimer(){
    setState(() {
      if (timer.isActive){
        b = "Continue";
        timer.cancel();
      }
      else{
        b = "Stop Timer";
        timer.cancel();
        _StartTimer();
      } 
    });
  }


  _onPressed(){
    if (timer != null){
      if(works){
        return 0;
      }
    }
    _StartTimer();
  }

  _ResetTimer(){
    setState(() {
      percent = 0;
      Working = 25;
      Seconds = 0;
      Time = 25 * 60;
      timer.cancel();
      b = "Stop Timer";
      works = false;
    });

  }

  @override
  Widget build(BuildContext context){
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: Text(
                "Pomodoro Timer",
                style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            )),
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff1542bf),Color(0xff51a8ff)],
                  begin: FractionalOffset(0.5, 1)
                )
              ),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: new CircularPercentIndicator(
                      radius: 200.0,
                      lineWidth: 13.0,
                      percent: percent,
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Text(
                        "$Working:$Seconds",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 60.0,
                        ),
                      ),
                      progressColor: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.0),
                            topLeft: Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(1.0),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "Study Time",
                                            style: TextStyle(
                                              fontSize: 25.0,
                                            ),
                                          ),
                                          SizedBox(height: 10.0),
                                          Text(
                                            "25",
                                            style: TextStyle(
                                              fontSize: 60.0,
                                            ),
                                          )
                                        ],
                                      )
                                  ),
                                  Expanded(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "Break Time",
                                            style: TextStyle(
                                              fontSize: 25.0,
                                            ),
                                          ),
                                          SizedBox(height: 10.0),
                                          Text(
                                            "5",
                                            style: TextStyle(
                                              fontSize: 60.0,
                                            ),
                                          )
                                        ],
                                      )
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 28.0),
                              child: Column(
                                children: [
                                  RaisedButton(
                                    onPressed: _onPressed,
                                    color: works ? Colors.grey : Colors.blue,
                                    textColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100.00),
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: Text(
                                            "Start Studying"
                                        )
                                    ),
                                  ),
                                  
                                  Container(
                                    height: 60.00,
                                    width: 300.00,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: RaisedButton(
                                            onPressed: _ResetTimer, 
                                            color: Colors.red,
                                            textColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(100.00),
                                            ),
                                            child: Padding(
                                                padding: EdgeInsets.all(20.0),
                                                child: Text(
                                                    "Reset Timer"
                                                )
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 1.0,),
                                        Expanded(
                                          child: RaisedButton(
                                            onPressed: _StopTimer,
                                            color: Colors.blue,
                                            textColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(200.00),
                                            ),
                                            child: Padding(
                                                padding: EdgeInsets.all(20.0),
                                                child: Text(
                                                    "$b"
                                                )
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ),
                                ],
                              )
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ),
    );
  }

}
