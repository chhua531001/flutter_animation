import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' show radians;

class FABcircularAnimation extends StatefulWidget {
  const FABcircularAnimation({super.key});

  @override
  State<FABcircularAnimation> createState() => _FABcircularAnimationState();
}

class _FABcircularAnimationState extends State<FABcircularAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fab Circular Animation Demo"),
      ),
      body: Center(
        child: RadialAnimatedMenu(
          controller: controller,
        ),
      ),
    );
  }
}
 // that's it from today video thank you 
class RadialAnimatedMenu extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> scale;
  final Animation<double> translate;
  final Animation<double> rotation;
  RadialAnimatedMenu({super.key, required this.controller})
      : scale = Tween<double>(begin: 1, end: 0.0).animate(
          CurvedAnimation(parent: controller, curve: Curves.linear),
        ),
        translate = Tween<double>(begin: 0.0, end: 110.0).animate(
          CurvedAnimation(parent: controller, curve: Curves.ease),
        ),
        rotation = Tween<double>(begin: 0.0, end: 360.8).animate(
          CurvedAnimation(
              parent: controller,
              curve: const Interval(0.0, 0.8, curve: Curves.bounceIn)),
        );

  bool reverse = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, index) {
        return Transform.rotate(
          angle: radians(rotation.value),
          child: Stack(
            alignment: Alignment.center,
            children: [
              itemsButton(0, color: Colors.orange, icon: Icons.home),
            ],
          ),
        );
      },
    );
  }

  itemsButton(double angle, {required Color color, required IconData icon}) {
    final double rad = radians(angle);
    return Transform(
      transform: Matrix4.identity()
        ..translate(
          (translate.value) * cos(rad),
          (translate.value) * sin(rad),
        ),
      //多個FloatingActionButton時，要給不同的heroTag以示區分
      child: FloatingActionButton(
        heroTag: "$rad",
        onPressed: () {
          if(reverse) {
            controller.forward();
            print("forward");
          }
          else {
            controller.reverse();
            print("reverse");
          }
        },
        backgroundColor: color,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
