import 'package:flutter/material.dart';
import 'package:flutter_starter/src/common/widget/scaffold/scaffold_with_back_button.dart';

class ScaffoldWithAppBar extends StatelessWidget {
  const ScaffoldWithAppBar({
    super.key,
    this.body,
    this.resizeToAvoidBottomInset,
    this.title,
    this.actions,
    this.backgroundColor,
    this.bottomNavigationBar,
  });

  final Widget? body;
  final String? title;
  final bool? resizeToAvoidBottomInset;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) => ScaffoldWithBackButton(
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        title: title != null ? Text(title!) : null,
        actions: actions,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
      );
}
