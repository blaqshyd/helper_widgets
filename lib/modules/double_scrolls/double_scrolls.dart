import 'package:flutter/material.dart';
import 'package:helper/core/extensions/num_ext.dart';
import 'package:helper/shared/constants/app_colors.dart';

class DoubleScrolls extends StatelessWidget {
  const DoubleScrolls({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              15.sbH,
              Text('Posts', style: Theme.of(context).textTheme.headlineMedium),
              15.sbH,
              Expanded(
                child: ListView.separated(
                  itemCount: 10,
                  separatorBuilder: (BuildContext context, int index) {
                    return index == 5
                        ? const Horizontal()
                        : const SizedBox.shrink();
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      contentPadding: 0.padA,
                      leading: CircleAvatar(
                        radius: 34,
                        child: Text('$index'),
                      ),
                      title: Text('Post $index'),
                      subtitle: const Text('This is a the post description'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Horizontal extends StatelessWidget {
  const Horizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: 6.padA,
            width: 190,
            decoration: BoxDecoration(
              color: AppColor.black5,
              borderRadius: BorderRadius.circular(12),
            ),
          );
        },
      ),
    );
  }
}
