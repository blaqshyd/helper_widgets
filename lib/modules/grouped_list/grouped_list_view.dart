import 'package:flutter/material.dart';
import 'package:helper/core/extensions/extensions_.dart';

class GroupedListView extends StatelessWidget {
  const GroupedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            contacts.sort();

            String name = contacts[index];
            // Index of the contacts - individual names
            String initials = contacts[index][0].toUpperCase();
            bool hasSameInitials = true;

            if (index == 0) {
              hasSameInitials = false;
            } else {
              String previousNameFirstLetter =
                  contacts[index - 1][0].toUpperCase();
              hasSameInitials = initials == previousNameFirstLetter;
            }

            if (index == 0 || !hasSameInitials) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  index == 0 ? const SizedBox.shrink() : 10.0.sbH,
                  Padding(
                    padding: 10.padA,
                    child: Text(
                      initials,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    margin: 10.padA,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(),
                    ),
                    child: Center(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Container(
                height: 50,
                width: double.infinity,
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child: Center(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

List<String> contacts = [
  "Liam",
  "Mia",
  "Noah",
  "Olivia",
  "Eva",
  "Felix",
  "Grace",
  "Hannah",
  "Isaac",
  "Jasmine",
  "Kevin",
  "Zane",
  "Lily",
  "Matthew",
  "Oliver",
  "Penelope",
  "Quincy",
  "Rebecca",
  "Samuel",
  "Ethan",
  "Fiona",
  "George",
  "Holly",
  "Xander",
  "Yara",
  "Zachary",
  "Bella",
  "Diana",
  "Theresa",
  "Ulysses",
  "Victoria",
  "William",
  "Isabel",
  "Jacob",
  "Katherine",
  "Aaron",
  "Benjamin",
  "Charlotte",
  "Daniel",
  "Peter",
  "Quinn",
  "Rachel",
  "Samuel",
  "Tessa",
  "Ulysses",
  "Caleb",
  'Julio',
  "Violet",
  "William",
  "Xena",
  "Yasmine",
  "Natalie",
  "Alex",
];
