import 'package:flutter/material.dart';
import 'package:flutter_starter/src/common/widget/scaffold/logger_scaffold.dart';

class InitializationProcessApp extends StatefulWidget {
  const InitializationProcessApp({
    super.key,
    required this.onInitializationComplete,
  });

  final void Function() onInitializationComplete;

  @override
  State<InitializationProcessApp> createState() =>
      _InitializationProcessAppState();
}

class _InitializationProcessAppState extends State<InitializationProcessApp>
    with TickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> fadeAnimation;
  late final Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
      ),
    );

    scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );

    animationController.forward().whenComplete(() {
      Future.delayed(const Duration(milliseconds: 300))
          .then((_) => widget.onInitializationComplete());
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoggerScaffold(
        backgroundColor: const Color(0xFFF3F2F8),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: FadeTransition(
              opacity: fadeAnimation,
              child: ScaleTransition(
                scale: scaleAnimation,
                child: Text("Initialization in progress"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
