import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoquiz/generated/l10n.dart';
import 'package:geoquiz/home/bloc/home_bloc.dart';
import 'package:geoquiz/home/widgets/animated_welcome_text.dart';
import 'package:geoquiz/home/widgets/bottom_navigation_bar.dart';
import 'package:geoquiz/home/widgets/category_list_widget.dart';
import 'package:geoquiz/home/widgets/welcome_text_widget.dart';
import 'package:geoquiz/services/airtable_service.dart';
import '../services/connectivity_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        RepositoryProvider.of<AirtableService>(context),
        RepositoryProvider.of<ConnectivityService>(context),
      )..add(LoadApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).home_appbar_title,
          ),
        ),
        bottomNavigationBar: BottomNavigationBarWidget(index: 0,),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeLoadedState) {
              return Column(
                children: [
                  WelcomeTextWidget(),
                  CategoryList(
                    categories: state.categories,
                  ),
                  SizedBox(width: 10.0, height: 36.0),
                  AnimatedWelcomeText(),
                ],
              );
            }
            if (state is HomeNoInternetState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

}

