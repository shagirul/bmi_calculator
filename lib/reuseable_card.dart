import 'package:flutter/material.dart';

//reusable class is nothing but bulding the same container for us
class Reusable extends StatelessWidget {
  Reusable({required this.colour, required this.cardchild});
  final Color colour;
  final Widget cardchild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardchild, //here cardchild is a widget inside our container
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: colour,
      ),
    );
  }
}
