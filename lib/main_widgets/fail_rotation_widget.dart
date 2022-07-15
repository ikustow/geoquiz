import 'package:flutter/material.dart';

class FailRotationWidget extends StatefulWidget {
  FailRotationWidgetState createState() => FailRotationWidgetState();
}

class FailRotationWidgetState extends State<FailRotationWidget> with TickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync: this,
        value: 0.05,
        lowerBound: 0.01,
        upperBound: 0.9
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    _controller.forward();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: RotationTransition(
          turns: _animation,
          alignment: Alignment(0.1, 0.1),
          child: Icon(Icons.add_rounded, color: Colors.deepOrange, size: 60,)
      ),
    );
  }
}