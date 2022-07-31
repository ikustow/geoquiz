import 'package:flutter/material.dart';

class FireRotationWidget extends StatefulWidget {
  const FireRotationWidget({Key? key}) : super(key: key);

  @override
  FireRotationWidgetState createState() => FireRotationWidgetState();
}

class FireRotationWidgetState extends State<FireRotationWidget> with TickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: RotationTransition(
          turns: _animation,
          alignment: const Alignment(0.1, 0.1),
          child: const Icon(Icons.whatshot, color: Colors.deepOrange, size: 60,)
      ),
    );
  }
}