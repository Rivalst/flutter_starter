import 'package:flutter/material.dart';
import 'package:flutter_starter/src/common/routes/routes.dart';
// import 'package:flutter_starter/src/common/routes/routes.dart';
import 'package:go_router/go_router.dart';

class LoggerScaffold extends StatelessWidget {
  const LoggerScaffold({
    super.key,
    this.appBar,
    this.body,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset,
    this.floatingActionButton,
  });

  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final Widget? floatingActionButton;
  final bool isShowLogger = true;

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: appBar,
        backgroundColor: backgroundColor,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        body: Stack(children: [
          if (body != null) body!,
          if (isShowLogger)
            Positioned(
              bottom: 20.0,
              left: 20.0,
              child: SafeArea(
                child: IconButton.filledTonal(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.grey.withOpacity(0.70)),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  onPressed: () => context.push(Routes.logger),
                  icon: const Icon(Icons.monitor_heart_outlined),
                ),
              ),
            ),
        ]),
      );
}
