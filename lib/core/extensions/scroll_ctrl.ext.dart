import 'package:flutter/material.dart';

extension ScrollControllerX on ScrollController {
//* Pagination

  bool get isAtEndOfList {
    return offset >= (position.maxScrollExtent - 50) && !position.outOfRange;
  }

//* Scroll to bottom
  void scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (hasClients && position.pixels != position.maxScrollExtent) {
        jumpTo(position.maxScrollExtent);
      }
    });
  }

  void animateDown() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (hasClients && position.pixels != position.maxScrollExtent) {
        animateTo(
          position.maxScrollExtent,
          duration: const Duration(milliseconds: 100),
          curve: Curves.bounceIn,
        );
      }
    });
  }
}
