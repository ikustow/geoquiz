import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoquiz/authentication/bloc/auth_bloc.dart';
import 'package:geoquiz/theme.dart';

import '../../generated/l10n.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: AppButtonStyle.signOutButtonStyle,
      child: Text(S.of(context).sign_out_button_title,),
      onPressed: () {
        // Signing out the user
        context.read<AuthBloc>().add(SignOutRequested());
      },
    );
  }
}
