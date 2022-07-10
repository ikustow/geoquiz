import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoquiz/models/question.dart';
import 'package:geoquiz/question/bloc/qion_bloc.dart';
import 'package:geoquiz/question/question_page.dart';

import '../services/airtable_service.dart';

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



class GoNextButton extends StatelessWidget {
  final String questionInfo;
  final int questionNumber;
  const GoNextButton({Key? key, required this.questionNumber, required this.questionInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionBloc(
        RepositoryProvider.of<AirtableService>(context),
      )..add(NextQuestionEvent(questionInfo,questionNumber)),
      child:
        BlocBuilder<QuestionBloc,QuestionState>(
            builder: (context, state) {
              if (state is NextQuestionState) {
                return TextButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  QuestionPage(category: questionInfo, id: questionInfo, questionNumber:state.questionNumber,)),
                  );
                }, child: Text("Go next"),
                );
              }

              return Text('TE');
            },
      ),
    );
  }
}


