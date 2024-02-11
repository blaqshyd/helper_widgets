import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Debouncers extends StatefulWidget {
  const Debouncers({super.key});

  @override
  DebouncersState createState() => DebouncersState();
}

class DebouncersState extends State<Debouncers> {
  Timer? _debounce;
  final _debouceDuration = const Duration(milliseconds: 500);

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      // Cancel the previous debounced call
      if (_debounce?.isActive ?? false) _debounce!.cancel();

      // Schedule a new debounced call
      _debounce = Timer(_debouceDuration, () {
        loadMoreItems();
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void loadMoreItems() {
    if (kDebugMode) print('Loading more items...');
    // Implement your logic to load more items here
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Scrolling Debouncing in Flutter'),
        ),
        body: ListView.builder(
          controller: _scrollController,
          itemCount: 50,
          itemBuilder: (context, index) {
            return ListTile(title: Text('Item $index'));
          },
        ),
      ),
    );
  }
}
