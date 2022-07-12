import 'package:flutter/material.dart';

abstract class AppButtonStyle {
  static const Color rightColor = Colors.green;
  static const Color rightTextColor = Colors.white;
  static const Color primaryColor = Colors.indigo;

  static final ButtonStyle RightButton = ButtonStyle(

    foregroundColor: MaterialStateProperty.all(rightTextColor),
    backgroundColor: MaterialStateProperty.all(rightColor),
    textStyle: MaterialStateProperty.all(
      TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w800,
      ),
    ),
    padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(horizontal: 24, vertical: 8)),
  );

  static final ButtonStyle DefaultButton = ButtonStyle(

    foregroundColor: MaterialStateProperty.all(rightTextColor),
    textStyle: MaterialStateProperty.all(
      TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w300,
      ),
    ),
    padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(horizontal: 24, vertical: 8)),
  );

  static final ButtonStyle startQuizButton = ButtonStyle(

    foregroundColor: MaterialStateProperty.all(rightTextColor),
    textStyle: MaterialStateProperty.all(
      TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    ),
    padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(horizontal: 24, vertical: 8)),
  );
}