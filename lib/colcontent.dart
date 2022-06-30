import 'package:flutter/material.dart';
import 'constants.dart';
//this class is only build for two container male/female(only)//
//have no relation with other 3 container in column//

class colcontent extends StatelessWidget {
  final IconData icon;
  final String label;
  colcontent({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          // FontAwesomeIcons.mars,
          icon,
          size: 80, color: Colors.white,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          // "MALE",
          label,
          style: labeltextstyle,
        )
      ],
    );
  }
}
