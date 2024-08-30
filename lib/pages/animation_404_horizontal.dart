import 'package:flutter/material.dart';

class Flutter404HorizontalAnimation extends StatefulWidget {
  const Flutter404HorizontalAnimation({super.key});

  @override
  State<Flutter404HorizontalAnimation> createState() => _Flutter404HorizontalAnimationState();
}

class _Flutter404HorizontalAnimationState extends State<Flutter404HorizontalAnimation>
    with SingleTickerProviderStateMixin {
  // animationController will control tha animation.
  late AnimationController _animationController;

  @override
  void initState() {
    // Initialize the animationController wit a duration 2 seconds for both forward and reverse animation
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      reverseDuration: const Duration(seconds: 2),
    )
      // add a listener to check the status of the animation.
      // if the animation is completed, it reverse back.
      // if it si dismissed (reached the beginning), it forwards again.

      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });
    // start the animation in the forward direction.
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //標準是以短邊為主
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: const Text("Animation 404 Demo"),
      ),
      body: Stack(
        children: [
          // the first positioned widget displays an animated image that rotates back and forth.
          Positioned(
            bottom: height / 4.4,
            right: height / 20,
            child: AnimatedBuilder(
              animation: _animationController,
              child: Image.asset(
                "images/light.png",
                height: height * 1.3,
              ),
              builder: (context, widget) {
                // the transform widget is used to rotate the image around it's bottom-center point.
                return Transform.rotate(
                  angle:- _animationController
                      .value, // rotate the a image according to tha animation value
                  alignment: Alignment.bottomCenter,
                  child: widget,
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            right: height / 2.7,
            child: Image.asset(
              "images/source.png",
              width: height / 4.6,
            ),
          ),
          Center(
            child: Column(
              children: [
                Text(
                  "404",
                  style: TextStyle(
                    fontSize: height / 5,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  "Page Not Found",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: height * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
