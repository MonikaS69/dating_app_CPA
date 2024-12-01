import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

var backGroundOnboard = Colors.white;
const backGroundColor = Color(0xFFFFFFFF);
var textBody = HexColor("#323755");
const textHeader = Colors.black;

var primaryRed = HexColor("#E94057");

const text1 = Colors.black;
const text2 = Colors.white;


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