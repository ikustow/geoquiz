import 'package:flutter/material.dart';
import 'package:geoquiz/generated/l10n.dart';

class ProgressValuesWidget extends StatelessWidget {
  final int currentValue;
  final int totalValue;

  const ProgressValuesWidget(
      {Key? key, required this.currentValue, required this.totalValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        itemCount: totalValue,
        itemBuilder: (BuildContext context, int index) {
          var extraindex = index + 1;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2,
                    color: Colors.black,
                  ),
                ),
                // margin: EdgeInsets.all(4),
                color: Colors.white,
                shadowColor: Colors.black87,
                elevation: 5,
                child: SizedBox(
                  width: 150.0,
                  height: 60.0,
                  child: ListTile(
                    leading: (extraindex < currentValue)
                        ? Icon(Icons.star, color: Colors.amber, size: 45)
                        : Icon(Icons.star, color: Colors.grey, size: 45),
                    tileColor: (extraindex < currentValue)
                        ? Colors.green
                        : Colors.deepOrangeAccent[100],
                    title: (extraindex < currentValue)
                        ? Text(
                      S.of(context).done_task_title,
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    )
                        : Text(
                      S.of(context).not_done_task_title,
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}