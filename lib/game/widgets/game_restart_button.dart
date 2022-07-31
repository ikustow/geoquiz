
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoquiz/game/bloc/game_bloc.dart';
import 'package:geoquiz/generated/l10n.dart';
import 'package:geoquiz/theme.dart';

class GameRestartButton extends StatelessWidget {
  final String questionInfo;
  final int questionNumber;
  const GameRestartButton({Key? key, required this.questionNumber, required this.questionInfo, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   TextButton(
      style: AppButtonStyle.goNexttButton,
      onPressed: () {
        return context.read<GameBloc>().add(LoadingApiEvent(questionInfo,questionInfo,questionNumber));
      }, child: Text(S.of(context).restart_title,),
    );
  }
}