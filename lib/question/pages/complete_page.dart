import 'package:flutter/material.dart';
import 'package:geoquiz/generated/l10n.dart';

import '../../main_widgets/bottom_navigation_bar.dart';

class CompletePage extends StatelessWidget {
  final category;

  const CompletePage({Key? key, required this.category,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).github_account_title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${S.of(context).congratulations_text} \n ${S.of(context).finished_text}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              '${category}',
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              '${S.of(context).category_text}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar:  BottomNavigationBarWidget(index: 0,),
    );
  }
}
