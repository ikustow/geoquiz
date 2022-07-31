import 'package:flutter/material.dart';

class MainProgressCard extends StatelessWidget {
  final String description;
  final String level;

  const MainProgressCard(
      {Key? key, required this.description, required this.level})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          width: 2,
          color: Colors.black,
        ),
      ),
      margin: const EdgeInsets.all(10),
      color: Colors.white,
      shadowColor: Colors.blueGrey,
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text(
              description,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              level,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
