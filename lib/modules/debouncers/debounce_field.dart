import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Debounce is used to make a delay while something is going on
class DebouncedSearchField extends StatefulWidget {
  const DebouncedSearchField({super.key});

  @override
  DebouncedSearchFieldState createState() => DebouncedSearchFieldState();
}

class DebouncedSearchFieldState extends State<DebouncedSearchField> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onSearchTextChanged);
  }

  void _onSearchTextChanged() {
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      // Call your search function here
      if (kDebugMode) print("Search: ${_controller.text}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'Search...',
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }
}
