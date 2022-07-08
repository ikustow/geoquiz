import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoquiz/home/bloc/home_bloc.dart';
import 'package:geoquiz/models/category.dart';
import 'package:geoquiz/question/question_page.dart';
import 'package:geoquiz/question/widgets.dart';
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
          title: Text('Best quiz in the world'),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeLoadedState) {
              return CategoryList(categories: state.categories,);
            }
            if (state is HomeNoInternetState) {
              return Text('no internet :(');
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  final List<Category> categories;

  const CategoryList({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(child: Column(
              children: [
                Text(categories[index].level, style: TextStyle(fontSize: 22)),
                ElevatedButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  QuestionPage(category: categories[index].description, id: categories[index].id, questionNumber: categories[index].progressValue ,)),
                  );
                }, child: Text("Start"))
              ],
            ));
          }
      );
  }
}

