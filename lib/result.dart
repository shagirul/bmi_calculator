import 'package:cal/constants.dart';
import 'package:flutter/material.dart';
import 'reuseable_card.dart';
import 'calculator_brain.dart';

class ResultPage extends StatelessWidget {
  ResultPage({
    required this.bmiresult,
    required this.resulttext,
    required this.interpretation,
  });
  final String bmiresult;
  final String resulttext;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 3.0,
          title: Center(child: Text("BMI CALCULATOR")),
          backgroundColor: Color(0xFF0A0E21),
        ),
        backgroundColor: Color(0xFF0A0E21),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  child: Text(
                    "Your Result",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                  flex: 5,
                  child: Reusable(
                    colour: activecardcolour,
                    cardchild: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Center(
                            child: Text(
                              resulttext,
                              style: TextStyle(
                                  color: Color(0XFF24D876), fontSize: 30),
                            ),
                          )),
                          Expanded(
                              child: Center(
                            child: Text(bmiresult,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 100,
                                    fontWeight: FontWeight.bold)),
                          )),
                          Expanded(
                              child: Center(
                            child: Text(interpretation,
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                )),
                          )),
                        ]),
                  )),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.all(12.0),
                    height: bottomboxheight,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0XFFEB1555),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Center(
                      child: Text("RE-CALCULATE",
                          style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 25,
                              color: Colors.white)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
