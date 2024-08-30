import 'package:flutter_animation/app_routes.dart';

class Page {
  final String title;
  final String route;

  Page({
    required this.title,
    required this.route,
  });
}

List<Page> animationPages = [
  Page(
    title: "ScrollListDemo",
    route: AppRoutes.scrollList,
  ),
  Page(
    title: "shoppingCardAnimation",
    route: AppRoutes.shoppingCardAnimation,
  ),
  Page(
    title: "OnBoardingAnimation",
    route: AppRoutes.onBoardingAnimation,
  ),
  Page(
    title: "AnimatedListDemo",
    route: AppRoutes.animatedList,
  ),
  Page(
    title: "Background Animation Demo",
    route: AppRoutes.animatedBackground,
  ),
  Page(
    title: "Button Animation Demo",
    route: AppRoutes.buttonAnimation,
  ),
  Page(
    title: "Download Button Animation Demo",
    route: AppRoutes.downloadButtonAnimation,
  ),
  Page(
    title: "Draggable-Scrollable Demo",
    route: AppRoutes.draggableScrollable,
  ),
  Page(
    title: "Fab Circular Animation Demo",
    route: AppRoutes.fabCircular,
  ),
  Page(
    title: "ListView Animation Demo",
    route: AppRoutes.listviewAnimation,
  ),
  Page(
    title: "Splash Screen Demo",
    route: AppRoutes.splashScreen,
  ),
  Page(
    title: "Moving Object Animation Demo",
    route: AppRoutes.movingObjectAnimation,
  ),
  Page(
    title: "Movie Animation Demo",
    route: AppRoutes.movieAnimation,
  ),
  Page(
    title: "Rive Login Demo",
    route: AppRoutes.riveLogin,
  ),
  Page(
    title: "Scale Transition Animation Demo",
    route: AppRoutes.scaleTransitionAnimation,
  ),
  Page(
    title: "Shimmer Loader Demo",
    route: AppRoutes.shimmerLoader,
  ),
  Page(
    title: "SwipeAble Button Animation Demo",
    route: AppRoutes.swipeAbleButtonAnimation,
  ),
  Page(
    title: "Swiper Animation Demo",
    route: AppRoutes.swiperAnimation,
  ),
  Page(
    title: "Plant Shop Demo",
    route: AppRoutes.plantShop,
  ),
  Page(
    title: "Animation 404 Demo",
    route: AppRoutes.animation404,
  ),
];
