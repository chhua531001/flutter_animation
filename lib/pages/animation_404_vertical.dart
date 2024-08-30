import 'package:flutter/material.dart';

class Flutter404VerticalAnimation extends StatefulWidget {
  const Flutter404VerticalAnimation({super.key});

  @override
  State<Flutter404VerticalAnimation> createState() => _Flutter404VerticalAnimationState();
}

class _Flutter404VerticalAnimationState extends State<Flutter404VerticalAnimation>
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
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: const Text("Animation 404 Demo"),
      ),
      body: Stack(
        children: [
          // the first positioned widget displays an animated image that rotates back and forth.
          Positioned(
            bottom: width / 4.4,
            right: width / 20,
            child: AnimatedBuilder(
              animation: _animationController,
              child: Image.asset(
                "images/light.png",
                height: width * 1.3,
              ),
              builder: (context, widget) {
                // the transform widget is used to rotate the image around it's bottom-center point.
                return Transform.rotate(
                  angle:- _animationController
                      .value+0.5, // rotate the a image according to tha animation value
                  alignment: Alignment.bottomCenter,
                  child: widget,
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            right: width / 2.7,
            child: Image.asset(
              "images/source.png",
              width: width / 4.6,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "404",
                  style: TextStyle(
                    fontSize: width / 5,
                    fontWeight: FontWeight.bold,
                    //讓字型顏色與背景顏色一致，來達成字不見功能, 因為燈光圖片是白色
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  "Page Not Found",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.bold,
                    //讓字型顏色與背景顏色一致，來達成字不見功能, 因為燈光圖片是白色
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
