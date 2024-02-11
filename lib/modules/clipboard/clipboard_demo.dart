import 'package:flutter/material.dart';
import 'package:helper/common/common.dart';
import 'package:helper/core/extensions/extensions_.dart';
import 'package:helper/services/clipboard_service.dart';

class ClipboardDemo extends StatefulWidget {
  const ClipboardDemo({Key? key}) : super(key: key);

  @override
  State<ClipboardDemo> createState() => _ClipboardDemoState();
}

class _ClipboardDemoState extends State<ClipboardDemo> {
  String? pastedText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(pastedText ?? ''),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonUtil.build(
                      borderRadius: BorderRadius.circular(12),
                      text: 'Copy Text',
                      cta: () async {
                        await ClipboardService.copy(
                          AppAssets.dialog,
                        );
                      },
                    ),
                    24.sbH,
                    ButtonUtil.build(
                      borderRadius: BorderRadius.circular(12),
                      text: 'Paste Text',
                      cta: () async {
                        String? pastedTxt = await ClipboardService.paste();
                        setState(() {
                          pastedText = pastedTxt;
                        });
                      },
                    ),
                    12.sbH
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
