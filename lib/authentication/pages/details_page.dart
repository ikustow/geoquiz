import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoquiz/authentication/bloc/auth_bloc.dart';
import 'package:geoquiz/authentication/pages/sign_in.dart';
import 'package:geoquiz/authentication/widgets/powered_by_section.dart';

import '../../generated/l10n.dart';
import '../../main_widgets/bottom_navigation_bar.dart';
import '../widgets/sign_out_button.dart';

class DetailsPageWidget extends StatelessWidget {
  const DetailsPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Getting the user from the FirebaseAuth Instance
    final githubTitle = S.of(context).github_title;
    final githubAccountTitle = S.of(context).github_account_title;
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).github_account_title),
      ),
      bottomNavigationBar:  const BottomNavigationBarWidget(index: 2,),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            // Navigate to the sign in screen when the user Signs Out
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const SignIn()),
                  (route) => false,
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            const SizedBox(height: 92),
            Text(
              'Email: \n ${user.email}',

              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Text(
              '$githubTitle \n $githubAccountTitle',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 92),
            const PoweredBySection(),
            const SizedBox(height: 36),
            const SignOutButton(),

          ],
        ),
      ),
    );
  }
}