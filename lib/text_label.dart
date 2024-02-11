import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  final _showLabelNotifier = ValueNotifier<bool>(true);
  @override
  void initState() {
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      _showLabelNotifier.value = !_focusNode.hasFocus;
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          color: Colors.grey[200],
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder(
                valueListenable: _showLabelNotifier,
                builder: (context, value, child) =>
                    _focusNode.hasFocus && _controller.text.isNotEmpty
                        ? const Text('Email')
                        : const SizedBox.shrink(),
              ),
              TextField(
                focusNode: _focusNode,
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'johndoe@gmail.com',
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
