import 'package:flutter/material.dart';
import 'package:geoquiz/progress/widgets/main_progress_card.dart';
import 'package:geoquiz/progress/widgets/progress_values_widget.dart';

class ProgressList extends StatelessWidget {
  final progressValues;

  const ProgressList({Key? key, required this.progressValues})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: progressValues.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              //Text(progressValues[index].categoryDescription),
              //Text(progressValues[index].level),
              MainProgressCard(
                description: progressValues[index].categoryDescription,
                level: progressValues[index].level,
              ),
              ProgressValuesWidget(
                currentValue: progressValues[index].currentQuestionNumber,
                totalValue: progressValues[index].numberOfTasks,
              ),
            ],
          );
        });
  }
}