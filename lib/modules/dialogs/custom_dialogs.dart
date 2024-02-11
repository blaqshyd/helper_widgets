import 'package:flutter/material.dart';
import 'package:helper/common/app_dialogs.dart';
import 'package:helper/core/extensions/extensions.dart';
import 'package:helper/services/share_service.dart';

class CustomDialogs extends StatelessWidget {
  const CustomDialogs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 'Custom Dialogs'.txt(fontSize: 24)),
      body: Center(
        child: Wrap(
          children: [
            ElevatedButton(
              onPressed: () => Dialogs.normalDialog(context),
              child: const Text('Normal Dialog'),
            ),
            ElevatedButton(
              onPressed: () => Dialogs.customDialog(context),
              child: const Text('Custom Dialog'),
            ),
            ElevatedButton(
              onPressed: () => Dialogs.alertDialog(context),
              child: Text('Alert Dialog', style: context.textTheme.bodySmall),
            ),
            ElevatedButton(
              onPressed: () => Dialogs.bottomSheet(context),
              child: const Text('Bottom Sheet'),
            ),
            ElevatedButton(
              onPressed: () => Dialogs.openBottomSheet(context),
              child: const Text('Open Bottom Sheet'),
            ),
            ElevatedButton(
              onPressed: () => Dialogs.modalSheet(context),
              child: const Text('Modal Sheet'),
            ),
            ElevatedButton(
              onPressed: () => Dialogs.loader(context),
              child: const Text('Loader'),
            ),
            ElevatedButton(
              onPressed: () => Dialogs.showSnackbar(
                context,
                message: 'Hello Snack',
              ),
              child: const Text('Normal Snack'),
            ),
            ElevatedButton(
              onPressed: () => Dialogs.successToast(context),
              child: const Text('Toast Snack - Success'),
            ),
            ElevatedButton(
              onPressed: () => Dialogs.errorToast(context),
              child: const Text('Toast Snack - Error'),
            ),
            ElevatedButton(
              onPressed: () => Dialogs.infoToast(context),
              child: const Text('Toast Snack - Info'),
            ),
            ElevatedButton(
              onPressed: () => Dialogs.successSnack(
                context,
                message: 'Successful',
              ),
              child: const Text('Success Snack'),
            ),
            ElevatedButton(
              onPressed: () => Dialogs.errorSnack(
                context,
                message: 'Error',
              ),
              child: const Text('Error Snack'),
            ),
            ElevatedButton(
              onPressed: () => ShareService.shareLink('youtube.com'),
              child: const Text('Share Url'),
            ),
          ],
        ),
      ),
    );
  }
}
