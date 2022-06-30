import 'package:cal/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'colcontent.dart';
import 'reuseable_card.dart';
import 'constants.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female,
} //enum

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Gender?
      selectedgender; // " ? " help declare selectedgender as a null variable
  int height = 170;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3.0,
        title: Center(child: Text("BMI CALCULATOR")),
        backgroundColor: Color(0xFF0A0E21),
      ),
      backgroundColor: Color(0xFF0A0E21),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedgender = Gender.male;
                        });
                      },
                      child: Reusable(
                        colour: (selectedgender == Gender.male
                            ? activecardcolour
                            : inactivecardcolour), //default is set to else(inactivecardcolor) condition in ternary operation
                        cardchild: colcontent(
                          //here colcontent have same property like (mainaxisalignment, sizedbox) for both excepts icon and label property
                          icon: FontAwesomeIcons.mars,
                          label: "MALE",
                        ),
                      ),
                    )),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedgender = Gender.female;
                        });
                      },
                      child: Reusable(
                        colour: (selectedgender == Gender.female
                            ? activecardcolour
                            : inactivecardcolour), //default is set to else(inactivecardcolor) condition in ternary operation
                        cardchild: colcontent(
                          icon: FontAwesomeIcons.venus,
                          label: "FEMALE",
                        ),
                      ),
                    ))
                  ],
                )),
            Expanded(
                flex: 2,
                child: Reusable(
                  colour: activecardcolour,
                  cardchild: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Text(
                            "HEIGHT",
                            style: labeltextstyle,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(height.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 45.0,
                                  fontWeight: FontWeight.w900,
                                )),
                            Text("cm",
                                style: TextStyle(
                                  color: Color(0XFF8D8E98),
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Slider(
                          activeColor: Color(0XFFEB1555),
                          inactiveColor: Color(0XFF8D8E98),
                          min: 120,
                          max: 220,
                          value: height.toDouble(),
                          onChanged: (double newvalue) {
                            setState(() {
                              height = newvalue.round();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                        child: Reusable(
                      colour: activecardcolour,
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: labeltextstyle,
                          ),
                          Text(
                            weight.toString(),
                            style: TextStyle(
                                fontSize: 45.0,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  backgroundColor: Color(0XFF4C4F5E),
                                  child: Icon(FontAwesomeIcons.plus),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  backgroundColor: Color(0XFF4C4F5E),
                                  child: Icon(FontAwesomeIcons.minus),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
                    Expanded(
                        child: Reusable(
                      colour: activecardcolour,
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: labeltextstyle,
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(
                                fontSize: 45.0,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  backgroundColor: Color(0XFF4C4F5E),
                                  child: Icon(FontAwesomeIcons.plus),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  backgroundColor: Color(0XFF4C4F5E),
                                  child: Icon(FontAwesomeIcons.minus),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
                  ],
                )),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  CalculatorBrain cal =
                      CalculatorBrain(height: height, weight: weight);
                  Navigator.push(context, MaterialPageRoute(builder: (Context) {
                    return ResultPage(
                      bmiresult: cal.calculateBMI(),
                      interpretation: cal.getInterpretation(),
                      resulttext: cal.getResult(),
                    );
                  }));
                },
                child: Container(
                  margin: EdgeInsets.all(12.0),
                  height: bottomboxheight,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0XFFEB1555),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Center(
                    child: Text("CALCULATE",
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
    );
  }
}
