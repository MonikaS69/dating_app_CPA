import 'package:flutter/material.dart';

var backGroundOnboard = Colors.pink[50];
const backGroundColor = Color(0xFFFFFFFF);
const textHeader = Color.fromARGB(0, 31, 18, 22);
const textBody = Color.fromARGB(0, 152, 147, 148);

var colorButton1 = Container(
  decoration: ShapeDecoration(
    gradient: const LinearGradient(
      begin: Alignment(0.71, -0.71),
      end: Alignment(-0.71, 0.71),
      colors: [Color(0xFFFF84A7), Color(0xFFE03368)],
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
); 

// var primaryColor = Colors.cyan[100];
// var iconColor = Colors.cyan[700];
// var backGroundBtnColor = Colors.indigo;
// var textBtnColor = Colors.black87;