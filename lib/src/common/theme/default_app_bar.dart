import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:flutter/src/services/system_chrome.dart';

// AppBar(
// titleSpacing: 0.0,
// backgroundColor: appBarBackgroundColor ,
// title: NetworkCheckerWidget(
// connectedChild: title,
// ),
// leadingWidth: context.canPop() ? leadingWidthCanPop : 16.0,
// leading: context.canPop()
// ? SvgButton(
// AppSvg.chevronLeft,
// onTap: () {
// context.pop();
// },
// splashRadius: 12.0,
// color: Theme.of(context).palette.scaffoldBackButton,
// )
//     : const SizedBox(),
// actions: actions,
// bottom: PreferredSize(
// preferredSize: const Size.fromHeight(1.0),
// child: Divider(
// color: Theme.of(context).palette.divider,
// height: 1.0,
// ),
// ),
// ),

class DefaultAppBar extends AppBar {
  DefaultAppBar({
    super.key,
  });

  @override
  Widget? get title => Text('DefaultAppBar');

  @override
  Widget? get leading => super.leading;

  // @override
  // // TODO: implement actionsIconTheme
  // IconThemeData? get actionsIconTheme => throw UnimplementedError();
  //
  // @override
  // // TODO: implement automaticallyImplyLeading
  // bool get automaticallyImplyLeading => throw UnimplementedError();
  //
  // @override
  // // TODO: implement bottom
  // PreferredSizeWidget? get bottom => throw UnimplementedError();
  //
  // @override
  // // TODO: implement bottomOpacity
  // double get bottomOpacity => throw UnimplementedError();
  //
  // @override
  // // TODO: implement centerTitle
  // bool? get centerTitle => throw UnimplementedError();
  //
  // @override
  // // TODO: implement clipBehavior
  // Clip? get clipBehavior => throw UnimplementedError();
  //
  // @override
  // // TODO: implement elevation
  // double? get elevation => throw UnimplementedError();
  //
  // @override
  // // TODO: implement excludeHeaderSemantics
  // bool get excludeHeaderSemantics => throw UnimplementedError();
  //
  // @override
  // // TODO: implement flexibleSpace
  // Widget? get flexibleSpace => throw UnimplementedError();
  //
  // @override
  // // TODO: implement forceMaterialTransparency
  // bool get forceMaterialTransparency => throw UnimplementedError();
  //
  // @override
  // // TODO: implement foregroundColor
  // Color? get foregroundColor => throw UnimplementedError();
  //
  // @override
  // // TODO: implement iconTheme
  // IconThemeData? get iconTheme => throw UnimplementedError();
  //
  // @override
  // // TODO: implement key
  // Key? get key => throw UnimplementedError();
  //
  // @override
  // // TODO: implement leadingWidth
  // double? get leadingWidth => throw UnimplementedError();
  //
  // @override
  // // TODO: implement notificationPredicate
  // ScrollNotificationPredicate get notificationPredicate => throw UnimplementedError();
  //
  // @override
  // // TODO: implement preferredSize
  // Size get preferredSize => throw UnimplementedError();
  //
  // @override
  // // TODO: implement primary
  // bool get primary => throw UnimplementedError();
  //
  // @override
  // // TODO: implement scrolledUnderElevation
  // double? get scrolledUnderElevation => throw UnimplementedError();
  //
  // @override
  // // TODO: implement shadowColor
  // Color? get shadowColor => throw UnimplementedError();
  //
  // @override
  // // TODO: implement shape
  // ShapeBorder? get shape => throw UnimplementedError();
  //
  // @override
  // // TODO: implement surfaceTintColor
  // Color? get surfaceTintColor => throw UnimplementedError();
  //
  // @override
  // // TODO: implement systemOverlayStyle
  // SystemUiOverlayStyle? get systemOverlayStyle => throw UnimplementedError();
  //
  // @override
  // // TODO: implement titleSpacing
  // double? get titleSpacing => throw UnimplementedError();
  //
  // @override
  // // TODO: implement titleTextStyle
  // TextStyle? get titleTextStyle => throw UnimplementedError();
  //
  // @override
  // DiagnosticsNode toDiagnosticsNode({String? name, DiagnosticsTreeStyle? style}) {
  //   // TODO: implement toDiagnosticsNode
  //   throw UnimplementedError();
  // }
  //
  // @override
  // String toStringDeep({String prefixLineOne = '', String? prefixOtherLines, DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
  //   // TODO: implement toStringDeep
  //   throw UnimplementedError();
  // }
  //
  // @override
  // String toStringShallow({String joiner = ', ', DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
  //   // TODO: implement toStringShallow
  //   throw UnimplementedError();
  // }
  //
  // @override
  // String toStringShort() {
  //   // TODO: implement toStringShort
  //   throw UnimplementedError();
  // }
  //
  // @override
  // // TODO: implement toolbarHeight
  // double? get toolbarHeight => throw UnimplementedError();
  //
  // @override
  // // TODO: implement toolbarOpacity
  // double get toolbarOpacity => throw UnimplementedError();
  //
  // @override
  // // TODO: implement toolbarTextStyle
  // TextStyle? get toolbarTextStyle => throw UnimplementedError();
}
