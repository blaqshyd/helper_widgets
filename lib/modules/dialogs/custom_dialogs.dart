import 'package:flutter/material.dart';
import 'package:helper/core/extensions/index.dart';
import 'package:helper/services/local/share_service.dart';
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
              onPressed: () => AppDialog.normalDialog(),
              child: const Text('Normal Dialog'),
            ),
            ElevatedButton(
              onPressed: () => AppDialog.customDialog(),
              child: const Text('Custom Dialog'),
            ),
            ElevatedButton(
              onPressed: () => AppDialog.alertDialog(),
              child: Text('Alert Dialog', style: context.textTheme.bodySmall),
            ),
            ElevatedButton(
              onPressed: () => AppDialog.bottomSheet(),
              child: const Text('Bottom Sheet'),
            ),
            ElevatedButton(
              onPressed: () => AppDialog.openBottomSheet(),
              child: const Text('Open Bottom Sheet'),
            ),
            ElevatedButton(
              onPressed: () => AppDialog.modalSheet(),
              child: const Text('Modal Sheet'),
            ),
            ElevatedButton(
              onPressed: () => AppDialog.loader(),
              child: const Text('Loader'),
            ),
            ElevatedButton(
              onPressed: () => AppToast.success('Success'),
              child: const Text('Toast Snack - Success'),
            ),
            ElevatedButton(
              onPressed: () => AppToast.error('Error'),
              child: const Text('Toast Snack - Error'),
            ),
            ElevatedButton(
              onPressed: () => AppToast.info('Info'),
              child: const Text('Toast Snack - Info'),
            ),
            ElevatedButton(
              onPressed: () => AppToast.custom('Custom'),
              child: const Text('Toast Snack - Custom'),
            ),
            ElevatedButton(
              onPressed: () => AppToast.defaultSnack(
                'The request completed successfully and your data fetched.',
                isSuccess: true,
              ),
              child: const Text('Success Snack'),
            ),
            ElevatedButton(
              onPressed: () => AppToast.defaultSnack(
                'The request failed due to network problems.',
                // isSuccess: false,
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
