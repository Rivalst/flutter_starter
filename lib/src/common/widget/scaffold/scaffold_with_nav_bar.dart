
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
//
// class ScaffoldWithNavBar extends StatefulWidget {
//   const ScaffoldWithNavBar({
//     super.key,
//     required this.navigationShell,
//   });
//
//   final StatefulNavigationShell navigationShell;
//
//   @override
//   State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
// }
//
// class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
//   late final ValueNotifier<int> _index;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _index = ValueNotifier(widget.navigationShell.currentIndex);
//   }
//
//   @override
//   void didUpdateWidget(covariant ScaffoldWithNavBar oldWidget) {
//     if (widget.navigationShell.currentIndex != _index.value) {
//       _index.value = widget.navigationShell.currentIndex;
//     }
//     super.didUpdateWidget(oldWidget);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: widget.navigationShell,
//       // extendBody: true,
//       // floatingActionButton: Padding(
//       //   padding: const EdgeInsets.only(top: 18),
//       //   child: SizedBox.square(
//       //     dimension: 53,
//       //     child: FloatingActionButton(
//       //       onPressed: () => null,
//       //       tooltip: 'Increment',
//       //       child: Icon(Icons.add),
//       //       elevation: 0,
//       //       shape: const CircleBorder(),
//       //     ),
//       //   ),
//       // ),
//       // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: ValueListenableBuilder<int>(
//         valueListenable: _index,
//         builder: (
//           BuildContext context,
//           int selectedIndex,
//           Widget? child,
//         ) {
//           return ClipRRect(
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(20.0),
//               topRight: Radius.circular(20.0),
//             ),
//             child: NavigationBarTheme(
//               data: NavigationBarThemeData(
//                 labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
//                   (Set<WidgetState> states) => states.contains(WidgetState.selected)
//                       ? TextStyle(
//                           color: Theme.of(context).palette.activeColor,
//                           fontSize: 11,
//                           fontWeight: FontWeight.w700,
//                         )
//                       : TextStyle(
//                           color: Theme.of(context).palette.labelTabUnselectedColor,
//                           fontSize: 11,
//                           fontWeight: FontWeight.w600,
//                         ),
//                 ),
//               ),
//               child: NavigationBar(
//                 // height: Platform.isIOS ? 54.0 : 72.0,
//                 selectedIndex: selectedIndex,
//                 onDestinationSelected: _onTap,
//                 indicatorColor: Colors.transparent,
//                 backgroundColor: Theme.of(context).palette.primary,
//                 destinations: const [
//                   NavigationDestination(
//                     icon: _SelectedIcon(
//                       assets: AppSvg.auctionTab,
//                       isSelected: false,
//                     ),
//                     selectedIcon: _SelectedIcon(
//                       assets: AppSvg.auctionTab,
//                       isSelected: true,
//                     ),
//                     label: 'Auctions',
//                   ),
//                   NavigationDestination(
//                     icon: _SelectedIcon(
//                       assets: AppSvg.fundsTab,
//                       isSelected: false,
//                     ),
//                     selectedIcon: _SelectedIcon(
//                       assets: AppSvg.fundsTab,
//                       isSelected: true,
//                     ),
//                     label: 'Funds',
//                   ),
//                   NavigationDestination(
//                     icon: _SelectedIcon(
//                       assets: AppSvg.participantTab,
//                       isSelected: false,
//                     ),
//                     selectedIcon: _SelectedIcon(
//                       assets: AppSvg.participantTab,
//                       isSelected: true,
//                     ),
//                     label: 'Participant',
//                   ),
//                   NavigationDestination(
//                     icon: _SelectedIcon(
//                       assets: AppSvg.profileTab,
//                       isSelected: false,
//                     ),
//                     selectedIcon: _SelectedIcon(
//                       assets: AppSvg.profileTab,
//                       isSelected: true,
//                     ),
//                     label: 'Profile',
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   void _onTap(int index) {
//     if (index == _index.value) return;
//     widget.navigationShell.goBranch(
//       index,
//       initialLocation: index == widget.navigationShell.currentIndex,
//     );
//     _index.value = index;
//   }
// }
//
// class _SelectedIcon extends StatelessWidget {
//   const _SelectedIcon({
//     required this.assets,
//     required this.isSelected,
//   });
//
//   final String assets;
//   final bool isSelected;
//
//   @override
//   Widget build(BuildContext context) {
//     return SvgIcon(
//       assets,
//       fit: BoxFit.scaleDown,
//       color: isSelected ? Theme.of(context).palette.deepActiveColor : null,
//     );
//   }
// }
