import 'package:flutter/material.dart';
import 'package:helper/shared/shared.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate({Key? key});

  List<String> userList = [
    'William',
    'Adele',
    'Fiyin',
    'Kiel',
    'Omo ila',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () => query = '', icon: const Icon(Iconsax.close_square))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Iconsax.arrow_left));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];

    for (var user in userList) {
      if (user.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(user);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(matchQuery[index]),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    final theme = Theme.of(context);

    for (var user in userList) {
      if (user.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(user);
      }
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSizing.h20,
          Text(
            "Recent Searches",
            style: theme.textTheme.bodyMedium,
          ),
          AppSizing.h20,
          Flexible(
            child: ListView.builder(
              itemCount: matchQuery.length,
              itemBuilder: (context, index) => ListTile(
                leading: const CircleAvatar(radius: 24),
                title: Text(matchQuery[index]),
                trailing: const Icon(Iconsax.close_circle),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
