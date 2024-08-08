import 'package:flutter/material.dart';
import 'package:flutter_animation/pages/animated_background.dart';
import 'package:flutter_animation/pages/animated_list.dart';
import 'package:flutter_animation/pages/draggable_scrollable.dart';
import 'package:flutter_animation/pages/fab_circular_animation.dart';
import 'package:flutter_animation/pages/list_view_animation.dart';
import 'package:flutter_animation/pages/movie.dart';
import 'package:flutter_animation/pages/moving_object_animation.dart';
import 'package:flutter_animation/pages/rive_login_screen.dart';
import 'package:flutter_animation/pages/scale_transition.dart';
import 'package:flutter_animation/pages/scroll_list.dart';
import 'package:flutter_animation/pages/shimmer_loader.dart';
import 'package:flutter_animation/pages/shopping_cart_animation.dart';
import 'package:flutter_animation/pages/splash_screen.dart';
import 'package:flutter_animation/pages/swipeable_button_animation.dart';
import 'package:flutter_animation/pages/swiper_animation.dart';
import 'package:get/get.dart';
import 'models/page_model.dart';
import 'pages/download_button_animation.dart';
import 'pages/animated_onboarding.dart';
import 'app_routes.dart';
import 'pages/button_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.homePage: (context) => const MyHomePage(),
        AppRoutes.scrollList: (context) => const ScrollListDemo(),
        AppRoutes.shoppingCardAnimation: (context) =>
            const ShoppingCartButton(),
        AppRoutes.onBoardingAnimation: (context) =>
            const AnimatedOnboardingScreen(),
        AppRoutes.animatedList: (context) => const MyAnimatedList(),
        AppRoutes.animatedBackground: (context) => const BackgroundAnimation(),
        AppRoutes.buttonAnimation: (context) => const AnimatedButton(),
        AppRoutes.downloadButtonAnimation: (context) =>
            const DownloadButtonAnimation(),
        AppRoutes.draggableScrollable: (context) => const DraggableScrollable(),
        AppRoutes.fabCircular: (context) => const FABcircularAnimation(),
        AppRoutes.listviewAnimation: (context) => const ListViewAnimation(),
        AppRoutes.splashScreen: (context) => const MySplashScreen(),
        AppRoutes.movingObjectAnimation: (context) => const MovingObjectAnimation(),
        AppRoutes.movieAnimation: (context) => const MovieDisplay(),
        AppRoutes.riveLogin: (context) => const RiveLoginScreen(),
        AppRoutes.scaleTransitionAnimation: (context) => const ScaleTransitionAnimation(),
        AppRoutes.shimmerLoader: (context) => const ShimmerLoader(),
        AppRoutes.swipeAbleButtonAnimation: (context) => const SwipeAbleButtonAnimation(),
        AppRoutes.swiperAnimation: (context) => const SwiperAnimation(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Animation Demo"),
      ),
      body: content(),
    );
  }

  Widget content() {
    return Center(
      child: ListView.builder(
        itemCount: animationPages.length,
        itemBuilder: (context, index) {
          final currentPage = animationPages[index];
          return Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  //傳送參數到想顯示的頁面
                  Navigator.pushNamed(
                    context,
                    currentPage.route,
                    // arguments: {
                    //   "index": 1,
                    // },
                  );
                },
                child: Text(currentPage.title),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          );
        },
      ),
    );
  }
}
