import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoquiz/models/question.dart';
import 'package:geoquiz/question/bloc/qion_bloc.dart';
import 'package:geoquiz/question/right_answer_page.dart';
import 'package:geoquiz/question/widgets.dart';
import 'package:geoquiz/question/wrong_answer_page.dart';
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
                  ListOfAnswers(answers: state.answers, questionInfo: state.question,),
                ],
              );
            }
            return Text('TE');
          }),

        ),
      );
  }
}



class ListOfAnswers extends StatelessWidget {
  final Question questionInfo;
  final List <Answer> answers;
  const ListOfAnswers({Key? key, required this.answers, required this.questionInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          itemCount: answers.length,
          itemBuilder: (BuildContext context, int index) {
            return ElevatedButton(
              child:Text(answers[index].description, style: TextStyle(fontSize: 22)),
              onPressed: (){
//RightAnswerPage(questionInfo: questionInfo, answers: answers,
//                       ),
                if (answers[index].right){
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>RightAnswerPage(questionInfo: questionInfo, answers: answers,),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                }
                else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WrongAnswerPage(
                      ),
                    ),
                  );
                }
              },
            );
          }
      );
  }
}

