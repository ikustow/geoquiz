import 'package:flutter/material.dart';
import 'package:geoquiz/game/pages/game.dart';
import '../../generated/l10n.dart';
import '../../models/category.dart';

import '../../theme.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categories;

  const CategoryList({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                width: 4,
                color: Colors.black,
              ),
            ),
            elevation: 5,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(categories[index].description,
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(categories[index].level,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                  child: ElevatedButton(
                    style: AppButtonStyle.startQuizButton,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GamePage(
                              category: categories[index].description,
                              id: categories[index].name,
                              questionNumber:
                              categories[index].progressValue,
                            )),
                      );
                    },
                    child: Text(S.of(context).start_button_title,),),
                )
              ],
            ),);
        }
    );
  }
}


