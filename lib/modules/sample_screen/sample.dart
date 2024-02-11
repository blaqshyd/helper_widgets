import 'package:flutter/material.dart';

class SampleScreen extends StatefulWidget {
  const SampleScreen({super.key});

  @override
  State<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            cacheExtent: 10000,
            itemBuilder: (context, index) {
              return const StateTile(
                name: 'Daniel',
              );
            },
          ),
        ),
      ),
    );
  }
}

class StateTile extends StatefulWidget {
  final String name;
  const StateTile({
    super.key,
    required this.name,
  });

  @override
  State<StateTile> createState() => _StateTileState();
}

class _StateTileState extends State<StateTile> {
  late Future<String> alphabet;

  Future<String> getAlphabet(String input) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return input[0];
  }

  @override
  initState() {
    super.initState();
    alphabet = getAlphabet(widget.name);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: alphabet,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ListTile(
            title: Text(
              widget.name,
            ),
            leading: const CircleAvatar(),
          );
        }
        return ListTile(
          title: Text(
            widget.name,
          ),
          leading: CircleAvatar(
            child: Text(
              snapshot.data!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
