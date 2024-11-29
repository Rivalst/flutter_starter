import 'package:flutter/material.dart';
import 'package:flutter_starter/src/common/theme/extension/theme_extension.dart';
import 'package:flutter_starter/src/common/widget/scaffold/default_scaffold.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithBackButton extends StatelessWidget {
  const ScaffoldWithBackButton({
    super.key,
    this.body,
    this.resizeToAvoidBottomInset,
    this.title,
    this.actions,
    this.backgroundColor,
    this.leadingWidthCanPop,
    this.titleSpacing,
    this.bottomNavigationBar,
    this.appBarBackgroundColor,
  });

  final Widget? body;
  final Widget? title;
  final bool? resizeToAvoidBottomInset;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final double? leadingWidthCanPop;
  final double? titleSpacing;
  final Widget? bottomNavigationBar;
  final Color? appBarBackgroundColor;

  @override
  Widget build(BuildContext context) => DefaultScaffold(
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: AppBar(
          titleSpacing: 0.0,
          backgroundColor: appBarBackgroundColor,
          title: title,
          leadingWidth: context.canPop() ? leadingWidthCanPop : 16.0,
          leading: context.canPop()
              ? IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: context.pop,
                )
              : const SizedBox(),
          actions: actions,
        ),
        bottomNavigationBar: bottomNavigationBar,
        body: body,
      );
}
