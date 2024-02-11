import 'package:flutter/material.dart';

class SingleLessonStepCard extends StatelessWidget {
  const SingleLessonStepCard({
    super.key,
    required this.step,
  });

  final StepDetails step;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 3,
            spreadRadius: 3,
            offset: Offset(2, 2),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            step.title,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.red,
            ),
          ),
          if (step.location.isNotEmpty)
            Row(
              children: [
                const Icon(
                  Icons.pin,
                  size: 15,
                ),
                Text(
                  step.location,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    color: Colors.black,
                  ),
                ),
              ],
            )
          else
            Container(),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                step.time,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                step.duration,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              Text(
                step.name,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StepDetails {
  StepDetails({
    required this.title,
    required this.time,
    required this.duration,
    required this.name,
    // ignore: unused_element
    this.location = '',
    this.isCompleted = false,
  });

  final String title, time, duration, name;
  final String location;
  bool isCompleted;
}
