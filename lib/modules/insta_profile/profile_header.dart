import 'dart:io';

import 'package:flutter/material.dart';
import 'package:helper/common/common.dart';
import 'package:helper/core/extensions/extensions_.dart';
import 'package:helper/services/file_picker_service.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  File? image;

  void pickImage() async {
    final file = await FilePickerService.pickImage();
    if (file != null) {
      setState(() {
        image = file;
      });
      image!.log();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          50.sbH,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: pickImage,
                child: image != null
                    ? CircleAvatar(
                        radius: 40,
                        backgroundImage: FileImage(image!),
                      )
                    : const CircleAvatar(
                        radius: 40,
                        // child: Icon(Iconsax.frame_1_copy, size: 34),
                        backgroundImage: NetworkImage(AppAssets.image),
                      ),
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: '30\n',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const TextSpan(text: 'Posts')
                      ])),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: '30\n',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const TextSpan(text: 'Following')
                      ])),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: '30\n',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const TextSpan(text: 'Followers')
                      ])),
            ],
          ),
          AppSizing.h32,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: RichText(
                // textAlign: TextAlign.center,
                text: TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: [
                  TextSpan(
                    text: 'Daniel A',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const TextSpan(text: ' @blaqshyd\n'),
                  const TextSpan(text: 'Dart makes my heart Flutter')
                ])),
          ),
          AppSizing.h32,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: AppSizing.borderRadius * .6,
                  color: AppColor.black5,
                ),
                child: const Text('Following'),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: AppSizing.borderRadius * .6,
                  color: AppColor.black5,
                ),
                child: const Text('Message'),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: AppSizing.borderRadius * .6,
                  color: AppColor.black5,
                ),
                child: const Text('Call'),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: AppSizing.borderRadius * .6,
                  color: AppColor.black5,
                ),
                child: const Icon(
                  Icons.person_add_alt,
                  size: 22,
                ),
              ),
            ],
          ),
          AppSizing.h32,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...List.generate(
                5,
                (index) => const CircleAvatar(
                  radius: 32,
                  foregroundImage: NetworkImage(AppAssets.image),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
