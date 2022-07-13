import 'package:flutter/material.dart';
import 'package:geoquiz/home/home.dart';

import '../../authentication/details_page.dart';
import '../../generated/l10n.dart';

class BottomNavigationBarWidget extends StatefulWidget {

  final int index;
  const BottomNavigationBarWidget({Key? key, required this.index, }) : super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  late int selectedIndex = widget.index;

  @override
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;

      if (selectedIndex == 2) {
       Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const DetailsPageWidget()));
      }

      if (selectedIndex == 0) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomePage()));
      }

    });
  }

  Widget build(BuildContext context) {
    return BottomNavigationBar(



      currentIndex: selectedIndex,
      selectedFontSize: 18,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      selectedItemColor: Colors.black,

      items:  <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: S.of(context).home_bar_title,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart_outlined),
          label: S.of(context).progress_bar_title,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info_outline),
          label:  S.of(context).about_bar_title,
        ),
      ],
      onTap: onItemTapped,
    );
  }
}
