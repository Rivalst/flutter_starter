import 'dart:async';

import 'package:flutter/material.dart';

mixin PaginationScrollStateMixin<T extends StatefulWidget> on State<T> {
  late final ScrollController mixinScrollController;

  bool _isLoading = false;

  void setScrollController(Function() function) {
    mixinScrollController.addListener(() {
      final currentPosition = mixinScrollController.position.pixels;
      final edgeOffset = mixinScrollController.position.maxScrollExtent - 200;
      if (currentPosition >= edgeOffset) {
        if (!_isLoading) {
          _isLoading = true;
          function();
        }
      } else {
        _isLoading = false;
      }
    });
  }

  void jumpDownWhenLoading() {
    if (mixinScrollController.hasClients && mixinScrollController.position.atEdge) {
      if (mixinScrollController.position.pixels != 0) {
        Timer(
          const Duration(milliseconds: 30),
          () => mixinScrollController.jumpTo(mixinScrollController.position.maxScrollExtent),
        );
      }
    }
  }
}
