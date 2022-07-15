import 'package:flutter/material.dart';

abstract class AppButtonStyle {

  static const Color rightColor = Colors.green;
  static const Color wrongColor = Colors.red;

  static const Color rightTextColor = Colors.white;
  static const Color wrongTextColor = Colors.white;

  static const Color primaryColor = Colors.indigo;
  static const Color categoryButtonColor = Colors.amber;
  static  Color? defaultButtonColor = Colors.amber[100];
  static const Color categoryTextButtonColor = Colors.black87;

  static final ButtonStyle RightButton = ButtonStyle(

    shape:MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          side: BorderSide(
            width: 2,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.zero,
        )),
    shadowColor: MaterialStateProperty.all(categoryTextButtonColor),
    backgroundColor: MaterialStateProperty.all(rightColor),
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


  static final ButtonStyle WrongButton = ButtonStyle(

    shape:MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          side: BorderSide(
            width: 2,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.zero,
        )),
    shadowColor: MaterialStateProperty.all(categoryTextButtonColor),
    backgroundColor: MaterialStateProperty.all(wrongColor),
    foregroundColor: MaterialStateProperty.all(wrongTextColor),
    textStyle: MaterialStateProperty.all(
      TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    ),
    padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(horizontal: 24, vertical: 8)),
  );



  static final ButtonStyle DefaultButton = ButtonStyle(

    shape:MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          side: BorderSide(
            width: 2,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.zero,
        )),
    shadowColor: MaterialStateProperty.all(categoryTextButtonColor),
    backgroundColor: MaterialStateProperty.all(defaultButtonColor),
    foregroundColor: MaterialStateProperty.all(categoryTextButtonColor),
    textStyle: MaterialStateProperty.all(
      TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    ),
    padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(horizontal: 24, vertical: 8)),
  );

  static final ButtonStyle startQuizButton = ButtonStyle(
    shape:MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          side: BorderSide(
            width: 2,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.zero,
        )),
    shadowColor: MaterialStateProperty.all(categoryTextButtonColor),
    backgroundColor: MaterialStateProperty.all(categoryButtonColor),
    foregroundColor: MaterialStateProperty.all(categoryTextButtonColor),
    textStyle: MaterialStateProperty.all(
      TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    ),
    padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(horizontal: 24, vertical: 8)),
  );

  static final ButtonStyle GoNexttButton = ButtonStyle(

    shape:MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          side: BorderSide(
            width: 2,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.zero,
        )),
    shadowColor: MaterialStateProperty.all(categoryTextButtonColor),
    backgroundColor: MaterialStateProperty.all(primaryColor),
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


abstract class TextStyles {

  static const Color welcomeTextolor = Colors.black87;

  static final TextStyle welcomeTextStyle =  TextStyle(
    fontSize: 22,
    color: welcomeTextolor,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle userNameTextStyle =  TextStyle(
    fontSize: 22,
    color: welcomeTextolor,
    fontWeight: FontWeight.bold,
  );


}