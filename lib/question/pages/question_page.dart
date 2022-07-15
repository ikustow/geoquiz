import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoquiz/question/bloc/qion_bloc.dart';
import 'package:geoquiz/question/widgets/list_of_answers.dart';
import '../../generated/l10n.dart';
import '../../main_widgets/bottom_navigation_bar.dart';
import '../../main_widgets/error_widget.dart';
import '../../services/airtable_service.dart';
import '../widgets/main_question_info.dart';


class QuestionPage extends StatelessWidget {
  final String id;
  final String category;
  final int questionNumber;


  QuestionPage({Key? key, required this.id, required this.category, required this.questionNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appbarTitle = S.of(context).number_title;
    return BlocProvider(
      create: (context) => QuestionBloc(
        RepositoryProvider.of<AirtableService>(context),
      )..add(LoadQuestionApiEvent(id,category,questionNumber)),
      child: Scaffold(
        appBar: AppBar(title: Text("$appbarTitle $questionNumber"),),
        bottomNavigationBar: const BottomNavigationBarWidget(index: 0),
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
                  ListOfAnswers(answers: state.answers, questionInfo: state.question,currentQuestionNumber: questionNumber),
                ],
              );
            }
            return Container(
              child: CustomErrorWidget(),
            );
          }),

        ),
      );
  }
}





