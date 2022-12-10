import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../widgets/visible_animator.dart';
import './homepage_screen.dart';
import '../constants/colors.dart';

import '../components/animated_bottom_bar.dart';
import '../models/safe_area_values.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({super.key});

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen>
    with TickerProviderStateMixin {
  var _bottomNavIndex = 0;
  AnimationController? _fabAnimationController;
  AnimationController? _borderRadiusAnimationController;
  Animation<double>? fabAnimation;
  Animation<double>? borderRadiusAnimation;
  CurvedAnimation? fabCurve;
  CurvedAnimation? borderRadiusCurve;
  AnimationController? _hideBottomBarAnimationController;
  bool _isVisible = true;

  final iconList = <IconData>[
    Icons.home_filled,
    Icons.card_travel_rounded,
    Icons.favorite_border,
    Icons.notifications_none_rounded,
  ];

  @override
  void initState() {
    super.initState();
    _fabAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _borderRadiusAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    fabCurve = CurvedAnimation(
      parent: _fabAnimationController!,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    borderRadiusCurve = CurvedAnimation(
      parent: _borderRadiusAnimationController!,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve!);
    borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
      borderRadiusCurve!,
    );

    _hideBottomBarAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    Future.delayed(
      const Duration(seconds: 1),
      () => _fabAnimationController!.forward(),
    );
    Future.delayed(
      const Duration(seconds: 1),
      () => _borderRadiusAnimationController!.forward(),
    );
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (notification is UserScrollNotification &&
        notification.metrics.axis == Axis.vertical) {
      switch (notification.direction) {
        case ScrollDirection.forward:
          _hideBottomBarAnimationController!.reverse();
          _fabAnimationController!.forward(from: 0);
          setState(() {
            _isVisible = true;
          });
          break;
        case ScrollDirection.reverse:
          _hideBottomBarAnimationController!.forward();
          _fabAnimationController!.reverse(from: 1);
          setState(() {
            _isVisible = false;
          });
          break;
        case ScrollDirection.idle:
          break;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: onScrollNotification,
        child: const HomepageScreen(),
      ),
      floatingActionButton: Visibility(
        visible: _isVisible,
        child: FloatingActionButton(
          backgroundColor: accentColor,
          child: const Icon(
            Icons.qr_code_scanner_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            _fabAnimationController!.reset();
            _borderRadiusAnimationController!.reset();
            _borderRadiusAnimationController!.forward();
            _fabAnimationController!.forward();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomBar(
        itemCount: iconList.length,
        splashRadius: 0,
        safeAreaValues: const SafeAreaValues(
            bottom: true, top: true, right: true, left: true),
        tabBuilder: (BuildContext context, int index) {
          final color = _bottomNavIndex == index
              ? Colors.white
              : const Color.fromARGB(104, 59, 77, 159);
          return Icon(
            iconList[index],
            size: 24,
            color: color,
          );
        },
        backgroundColor: bottomBarColor,
        activeIndex: _bottomNavIndex,
        splashColor: bottomBarColor,
        borderColor: Colors.transparent,
        activeColor: const Color.fromARGB(232, 233, 236, 255),
        inactiveColor: const Color.fromARGB(58, 66, 102, 255),
        notchAndCornersAnimation: borderRadiusAnimation,
        splashSpeedInMilliseconds: 300,
        gapLocation: GapLocation.center,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        hideAnimationController: _hideBottomBarAnimationController,
        blurEffect: false,
      ),
    );
  }
}
