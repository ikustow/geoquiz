import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../theme.dart';
import '../pages/sign_up.dart';

class WelcomeSignUpButton extends StatelessWidget {
  const WelcomeSignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  OutlinedButton(
      style: AppButtonStyle.welcomeSignUpButtonStyle,
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const SignUp()),
        );
      },
      child: Text(
        S.of(context).sign_up_button_title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
