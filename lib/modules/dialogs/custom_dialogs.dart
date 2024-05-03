import 'package:flutter/material.dart';
import 'package:helper/core/extensions/index.dart';
import 'package:helper/services/share_service.dart';
import 'package:helper/shared/widgets/app_dialog.dart';
import 'package:helper/shared/widgets/app_toast.dart';

class CustomDialogs extends StatelessWidget {
  const CustomDialogs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 'Custom Dialogs'.txt(fontSize: 24)),
      body: Center(
        child: Wrap(
          children: [
            ElevatedButton(
              onPressed: () => AppDialog.normalDialog(context),
              child: const Text('Normal Dialog'),
            ),
            ElevatedButton(
              onPressed: () => AppDialog.customDialog(context),
              child: const Text('Custom Dialog'),
            ),
            ElevatedButton(
              onPressed: () => AppDialog.alertDialog(context),
              child: Text('Alert Dialog', style: context.textTheme.bodySmall),
            ),
            ElevatedButton(
              onPressed: () => AppDialog.bottomSheet(context),
              child: const Text('Bottom Sheet'),
            ),
            ElevatedButton(
              onPressed: () => AppDialog.openBottomSheet(context),
              child: const Text('Open Bottom Sheet'),
            ),
            ElevatedButton(
              onPressed: () => AppDialog.modalSheet(context),
              child: const Text('Modal Sheet'),
            ),
            ElevatedButton(
              onPressed: () => AppDialog.loader(context),
              child: const Text('Loader'),
            ),
            ElevatedButton(
              onPressed: () => AppDialog.showBar(context, 'Goodyyy'),
              child: const Text('Normal Snack'),
            ),
            ElevatedButton(
              onPressed: () => AppToast.success(context),
              child: const Text('Toast Snack - Success'),
            ),
            ElevatedButton(
              onPressed: () => AppToast.error(context),
              child: const Text('Toast Snack - Error'),
            ),
            ElevatedButton(
              onPressed: () => AppToast.info(context),
              child: const Text('Toast Snack - Info'),
            ),
            ElevatedButton(
              onPressed: () => AppDialog.success(
                context,
                message: 'Successful',
              ),
              child: const Text('Success Snack'),
            ),
            ElevatedButton(
              onPressed: () => AppDialog.error(
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
