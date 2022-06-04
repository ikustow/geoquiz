import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoquiz/models/question.dart';
import 'package:geoquiz/question/bloc/qion_bloc.dart';
import '../models/answer.dart';
import '../services/airtable_service.dart';


class QuestionPage extends StatelessWidget {
  final String id;
  final String category;

  QuestionPage({Key? key, required this.id, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionBloc(
        RepositoryProvider.of<AirtableService>(context),
      )..add(LoadQuestionApiEvent(id,category)),
      child: Scaffold(
        appBar: AppBar(title: Text('test'),),
        body: BlocBuilder<QuestionBloc,QuestionState>(
          builder: (context, state) {
            if (state is QuestionLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is QuestionLoadedState) {
              return Column(

                children: [
                  MainQuestionInfo(questionInfo: state.question,),
                  ListOfAnswers(answers: state.answers,),
                ],
              );
            }
            return Text('TE');
          }),

        ),
      );
  }
}

class MainQuestionInfo extends StatelessWidget {
  final Question questionInfo;
  const MainQuestionInfo({Key? key, required this.questionInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("What the city?"),
        SizedBox(
          height: 10,
        ),
        Image.network(questionInfo.pictureUrl)
      ],
    );
  }
}

class ListOfAnswers extends StatelessWidget {
  final List <Answer> answers;
  const ListOfAnswers({Key? key, required this.answers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          itemCount: answers.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(child: Column(
              children: [
                Text(answers[index].description, style: TextStyle(fontSize: 22)),
              ],
            ));
          }
      );
  }
}

