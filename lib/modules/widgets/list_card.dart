import 'package:flutter/material.dart';

class TheCard extends StatelessWidget {
  const TheCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      decoration: BoxDecoration(
        border: Border.all(width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(
                  style: Theme.of(context).textTheme.titleMedium,
                  children: [
                    const TextSpan(text: 'Posted: '),
                    TextSpan(
                      text: '5 hours ago',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                )),
                Row(
                  children: [
                    const CircleAvatar(
                        radius: 4, backgroundColor: Colors.amber),
                    const SizedBox(width: 8),
                    Text('New', style: Theme.of(context).textTheme.titleMedium),
                  ],
                )
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'There will be no regular classes on 12th August',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.lightbulb_circle,
                      size: 36,
                    ),
                    const SizedBox(width: 8),
                    RichText(
                        text: TextSpan(
                      style: Theme.of(context).textTheme.titleMedium,
                      children: const [
                        TextSpan(text: 'BBA | '),
                        TextSpan(text: 'Sem1 | '),
                        TextSpan(text: '2023'),
                      ],
                    )),
                  ],
                ),
                const Icon(Icons.send)
              ],
            )
          ],
        ),
      ),
    );
  }
}
