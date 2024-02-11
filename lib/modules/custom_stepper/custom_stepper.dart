import 'package:flutter/material.dart';

import 'widgets/card.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper({super.key});

  @override
  Widget build(BuildContext context) {
    final List<StepDetails> steps = [
      StepDetails(
        title: 'LESSON1 - FLUTTER UI',
        time: '3 June, 10:00 am',
        duration: '60 min',
        name: 'dmgcoding',
        isCompleted: true,
      ),
      StepDetails(
        title: 'LESSON2 - STATE MANAGEMENT',
        time: '3 June, 11:00 am',
        duration: '90 min',
        name: 'dmgcoding',
        isCompleted: true,
      ),
      StepDetails(
        title: 'LESSON 3  - FLUTTER RIVERPOD',
        time: '3 June, 13:00 pm',
        duration: '60 min',
        name: 'dmgcoding',
        isCompleted: true,
      ),
      StepDetails(
        title: 'LESSON 4 - FLUTTER BLOC',
        time: '3 June, 11:00 am',
        duration: '90 min',
        name: 'dmgcoding',
      ),
      StepDetails(
        title: 'LESSON 5 - CLEAN ARCHITECTURE',
        time: '3 June, 13:00 pm',
        duration: '60 min',
        name: 'dmgcoding',
      ),
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: ListView.builder(
          itemCount: steps.length,
          itemBuilder: (ctx, index) {
            int nextIndex = index + 1;
            bool nextOneDone = true;
            if (nextIndex < steps.length) {
              nextOneDone = steps[nextIndex].isCompleted;
            }
            return _buildStepCard(
              steps[index],
              isFirst: index == 0,
              isLast: index == (steps.length - 1),
              nextLessonCompleted: nextOneDone,
            );
          },
        ),
      ),
    );
  }

  IntrinsicHeight _buildStepCard(StepDetails step,
      {bool isFirst = false,
      bool isLast = false,
      bool nextLessonCompleted = false}) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                isFirst
                    ? Expanded(child: Container())
                    : Expanded(
                        child: VerticalDivider(
                          color: step.isCompleted ? Colors.red : Colors.grey,
                          thickness: 2,
                          width: 2,
                        ),
                      ),
                step.isCompleted
                    ? Image.asset(
                        'assets/oval_red.png',
                        width: 16,
                      )
                    : Image.asset(
                        'assets/oval.png',
                        width: 16,
                      ),
                isLast
                    ? Expanded(flex: 2, child: Container())
                    : nextLessonCompleted
                        ? Expanded(
                            flex: 2,
                            child: VerticalDivider(
                              color:
                                  step.isCompleted ? Colors.red : Colors.grey,
                              thickness: 2,
                              width: 2,
                            ),
                          )
                        : const Expanded(
                            flex: 2,
                            child: VerticalDivider(
                              color: Colors.grey,
                              thickness: 2,
                              width: 2,
                            ),
                          ),
              ],
            ),
          ),
          Expanded(child: SingleLessonStepCard(step: step))
        ],
      ),
    );
  }
}
