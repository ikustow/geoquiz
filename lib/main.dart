import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoquiz/authentication/pages/sign_in.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:geoquiz/repositories/firebase_auth_repository.dart';
import 'package:geoquiz/services/airtable_service.dart';
import 'package:geoquiz/services/connectivity_service.dart';
import 'authentication/bloc/auth_bloc.dart';
import 'generated/l10n.dart';
import 'home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AirtableService(),
        ),
        RepositoryProvider(
          create: (context) => ConnectivityService(),
        )
      ],
      child: RepositoryProvider(
        create: (context) => AuthRepository(),
        child: BlocProvider(
          create: (context) => AuthBloc(
            authRepository: RepositoryProvider.of<AuthRepository>(context),
          ),
          child: MaterialApp(
            localizationsDelegates:const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            theme: ThemeData(
              primarySwatch: Colors.indigo,
            ),
            home: MultiRepositoryProvider(
              providers: [
                RepositoryProvider(
                  create: (context) => AirtableService(),
                ),
                RepositoryProvider(
                  create: (context) => ConnectivityService(),
                )
              ],
              child: StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    // If the snapshot has user data, then they're already signed in. So Navigating to the Dashboard.
                    if (snapshot.hasData) {
                      return const HomePage();
                    }
                    // Otherwise, they're not signed in. Show the sign in page.
                    return const SignIn();
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
