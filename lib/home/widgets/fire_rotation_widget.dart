import 'package:flutter/material.dart';

class FireRotationWidget extends StatefulWidget {
  FireRotationWidgetState createState() => FireRotationWidgetState();
}

class FireRotationWidgetState extends State<FireRotationWidget> with TickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync: this,
        value: 0.05,
        lowerBound: 0.01,
        upperBound: 1.0
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
      height: 80,
      child: RotationTransition(
          turns: _animation,
          alignment: Alignment(0.1, 0.1),
          child: Icon(Icons.whatshot, color: Colors.deepOrange, size: 80,)
      ),
    );
  }
}