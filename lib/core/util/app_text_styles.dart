import 'package:flutter/material.dart';

TextStyle getTitleStyle(
        {Color color = const Color(0xff005b96),
        double? fontSize = 18,
        FontWeight? fontWeight = FontWeight.bold}) =>
    TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );

TextStyle getbodyStyle(
        {Color color = const Color(0xFF000000),
        double? fontSize = 14,
        FontWeight? fontWeight = FontWeight.w400}) =>
    TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );

TextStyle getsmallStyle(
        {Color color = const Color(0xFF000000),
        double? fontSize = 12,
        FontWeight? fontWeight = FontWeight.w500}) =>
    TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );
