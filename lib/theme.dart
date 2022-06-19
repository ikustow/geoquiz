import 'package:flutter/material.dart';

abstract class AppButtonStyle {
  static const Color rightColor = Colors.green;
  static const Color primaryColor = Colors.indigo;

  static final ButtonStyle RightButton = ButtonStyle(

    foregroundColor: MaterialStateProperty.all(rightColor),
    textStyle: MaterialStateProperty.all(
      TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
    ),
    padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(horizontal: 24, vertical: 8)),
  );

  static final ButtonStyle DefaultButton = ButtonStyle(

    foregroundColor: MaterialStateProperty.all(primaryColor),
    textStyle: MaterialStateProperty.all(
      TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
    ),
    padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(horizontal: 24, vertical: 8)),
  );
}