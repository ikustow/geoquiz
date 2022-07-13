import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geoquiz/theme.dart';
import '../../generated/l10n.dart';

class WelcomeTextWidget extends StatelessWidget {
  const WelcomeTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24,),
        RichText(
          text: TextSpan(
            style: TextStyles.welcomeTextStyle,
            text: S.of(context).welcome_text_title,
            children: [
              TextSpan(text: FirebaseAuth.instance.currentUser!.email.toString(), style: TextStyles.userNameTextStyle),
            ],
          ),
        ),
        SizedBox(height: 24,),
      ],
    );
  }
}
