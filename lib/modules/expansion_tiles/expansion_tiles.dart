import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final List<String> selectedValues1 = [];
final List<String> selectedValues2 = [];

class ExpansionTilesW extends StatefulWidget {
  const ExpansionTilesW({Key? key}) : super(key: key);

  @override
  State<ExpansionTilesW> createState() => _ExpansionTilesWState();
}

class _ExpansionTilesWState extends State<ExpansionTilesW> {
  void onSelection1(String item) {
    setState(() {
      selectedValues1.contains(item)
          ? selectedValues1.remove(item)
          : selectedValues1.add(item);
    });
  }

  void onSelection2(String item) {
    setState(() {
      selectedValues2.contains(item)
          ? selectedValues2.remove(item)
          : selectedValues2.add(item);
    });
  }

  void onDatePressed() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
              color: AppColor.containerBgColor,
              child: Column(
                children: <Widget>[
                  Container(
                      color: AppColor.appBarBgColor,
                      height: 80.0,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  TextButton(
                                    onPressed: onDatePressed,
                                    style: const ButtonStyle(
                                        padding: MaterialStatePropertyAll(
                                            EdgeInsets.fromLTRB(
                                                4.0, 4.0, 4.0, 0.0)),
                                        minimumSize:
                                            MaterialStatePropertyAll(Size.zero),
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap),
                                    child: const Text(
                                      'Today,',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.appBarTextColor),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: onDatePressed,
                                    style: const ButtonStyle(
                                        padding: MaterialStatePropertyAll(
                                            EdgeInsets.all(4.0)),
                                        minimumSize:
                                            MaterialStatePropertyAll(Size.zero),
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          formatDate(),
                                          style: const TextStyle(
                                              color: AppColor.appBarTextColor),
                                        ),
                                        const Icon(
                                            Icons.arrow_drop_down_rounded,
                                            color: AppColor.appBarTextColor,
                                            size: 18.0)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () => {},
                            icon: const Icon(
                              Icons.settings,
                              color: AppColor.appBarTextColor,
                            ),
                          )
                        ],
                      )),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 30.0),
                        child: Column(
                          children: <Widget>[
                            ListTileContainer(
                              title: 'Compulsory tasks.',
                              rightIcon: Transform.rotate(
                                angle: 45,
                                child: const Icon(
                                  CupertinoIcons.pin_fill,
                                  size: 17.0,
                                  color: AppColor.appBarBgColor,
                                ),
                              ),
                              items: const <String>[
                                '5 daily prayers',
                                '3 daily duas',
                                'Read surah al-khaf'
                              ],
                              selections: selectedValues1,
                              onSelect: onSelection1,
                            ),
                            ListTileContainer(
                              title: 'Custom tasks.',
                              items: const <String>[
                                '5 daily prayers',
                                '4 daily prayers',
                                '3 daily prayers',
                                '2 daily prayers',
                                '1 daily prayers',
                              ],
                              selections: selectedValues2,
                              onSelect: onSelection2,
                            ),
                            ListTileContainer(
                              title: 'Custom tasks.',
                              items: const <String>[
                                '5 daily prayers',
                                '4 daily prayers',
                                '3 daily prayers',
                                '2 daily prayers',
                                '1 daily prayers',
                              ],
                              selections: selectedValues2,
                              onSelect: onSelection2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          mini: true,
          backgroundColor: AppColor.appBarBgColor,
          child: const Icon(
            Icons.add,
            size: 18.0,
            color: AppColor.containerBgColor,
          ),
        ),
      ),
    );
  }
}

class ListTileContainer extends StatelessWidget {
  const ListTileContainer({
    Key? key,
    required this.title,
    required this.items,
    required this.selections,
    this.onSelect,
    this.rightIcon,
  }) : super(key: key);
  final String title;
  final Widget? rightIcon;
  final List<String> items;
  final List<String> selections;
  final ValueChanged<String>? onSelect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: Column(
        children: <Widget>[
          Card(
            elevation: 1.5,
            margin: const EdgeInsets.only(bottom: 5.0),
            clipBehavior: Clip.hardEdge,
            color: AppColor.listTileBoxColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(8.0),
              ),
            ),
            child: Container(
              height: 40.0,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColor.tileTextColor),
                  ),
                  if (rightIcon != null) rightIcon!
                ],
              ),
            ),
          ),
          ...items.map((item) => Material(
                color: AppColor.containerBgColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: ListTile(
                    onTap: () => onSelect?.call(item),
                    contentPadding: const EdgeInsets.only(left: 12.0),
                    title: Text(
                      item,
                      style: const TextStyle(
                        color: AppColor.appBarBgColor,
                        fontSize: 14.0,
                      ),
                    ),
                    visualDensity: const VisualDensity(vertical: -4.0),
                    tileColor: AppColor.listTileColor,
                    trailing: Transform.scale(
                      scale: .85,
                      child: IgnorePointer(
                        child: Checkbox(
                            value: selections.contains(item),
                            shape: const CircleBorder(),
                            side: const BorderSide(
                              color: AppColor.radioInactiveColor,
                            ),
                            checkColor: AppColor.containerBgColor,
                            fillColor: MaterialStatePropertyAll(
                              selections.contains(item)
                                  ? AppColor.radioActiveColor
                                  : AppColor.radioInactiveColor,
                            ),
                            visualDensity: const VisualDensity(
                                horizontal: -2.0, vertical: -2.0),
                            onChanged: (value) {}),
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

String formatDate() {
  final date = DateTime.now();
  final List<String> months = [
    "january",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  return '${date.day} ${months.elementAt(date.month - 1)} ${date.year}';
}

abstract final class AppColor {
  static const Color bgColor = Color(0xFFDCE3E2);
  static const Color appBarBgColor = Color(0xFF0C314B);
  static const Color containerBgColor = Color(0xFFCDDADC);
  static const Color listTileBoxColor = Color(0xFFC4D3D7);
  static const Color listTileColor = Color(0xFFC9D6D9);
  static const Color radioInactiveColor = Color(0xFFB6C7CD);
  static const Color radioActiveColor = Color(0xFF0C314B);
  static const Color appBarTextColor = Color(0xFFCDDADC);
  static const Color tileTextColor = Color(0xFF0C314B);
}
