// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:helper/common/common.dart';

class MessageField extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onPressed;
  const MessageField({
    Key? key,
    this.controller,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              textInputAction: TextInputAction.newline,
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Type a message...',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 18,
                ),
                border: OutlineInputBorder(borderSide: BorderSide.none),
                filled: true,
                fillColor: AppColor.black6,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
