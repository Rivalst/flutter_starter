import 'package:flutter/material.dart';
import 'package:flutter_starter/src/common/widget/scaffold/scaffold_with_back_button.dart';

class ScaffoldWithTitle extends StatelessWidget {
  const ScaffoldWithTitle({
    super.key,
    this.body,
    this.resizeToAvoidBottomInset,
    required this.title,
    this.actions,
    this.backgroundColor,
    this.leadingWidthCanPop,
    this.titleSpacing,
    this.bottomNavigationBar,
  });

  final Widget? body;
  final String title;
  final bool? resizeToAvoidBottomInset;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final double? leadingWidthCanPop;
  final double? titleSpacing;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackButton(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      title: Text(title),
      actions: actions,
      leadingWidthCanPop: leadingWidthCanPop,
      titleSpacing: titleSpacing,
      bottomNavigationBar: bottomNavigationBar,
      body: body,
    );
  }
}
