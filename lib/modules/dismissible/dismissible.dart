import 'package:flutter/material.dart';

class DismissibleWidget extends StatefulWidget {
  const DismissibleWidget({super.key});

  @override
  State<DismissibleWidget> createState() => _DismissibleWidgetState();
}

class _DismissibleWidgetState extends State<DismissibleWidget> {
  final List<String> items = <String>[];
  final Map<DismissDirection, double> thresholds = <DismissDirection, double>{};

  @override
  void initState() {
    super.initState();

    items.addAll(["Entry 1", "Entry 2", "Entry 3", "Entry 4", "MapBox"]);
    thresholds[DismissDirection.endToStart] = 0.2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Dismissible Widget')),
        body: items.isEmpty
            ? const Center(
                child: Text('Empty List'),
              )
            : ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  var item = items[index];
                  return Dismissible(
                    key: ValueKey(item),
                    confirmDismiss: (direction) => Future.value(true),
                    onDismissed: (direction) {
                      items.removeAt(index);
                      setState(() {});
                    },
                    direction: DismissDirection.endToStart,
                    // how "far" the user needs to swipe to trigger the dismiss action
                    dismissThresholds: thresholds,
                    // defines a widget behind the swiped element
                    background: Container(
                        alignment: Alignment.centerRight,
                        color: Colors.black26,
                        child: const Padding(
                          padding: EdgeInsets.only(right: 30.0),
                          child: Icon(Icons.delete, color: Colors.white),
                        )),
                    child: Container(
                      height: 60,
                      color: Colors.black12,
                      padding: const EdgeInsets.all(8),
                      child: Center(child: Text(item)),
                    ),
                  );
                }));
  }
}
