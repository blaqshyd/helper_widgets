import 'package:flutter/material.dart';
import 'package:helper/shared/shared.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class CustomSearch extends StatefulWidget {
  const CustomSearch({super.key});

  @override
  CustomSearchState createState() => CustomSearchState();
}

class CustomSearchState extends State<CustomSearch> {
  List<String> userList = [
    'Pastor Eric',
    'Adele Amen',
    'Evangelist Adegboye',
    'Kiel Michael',
    'Deacon Samuel',
  ];

  String _searchText = '';
  List<String> _filteredUserList = [];

  void _filterList() {
    _filteredUserList = userList
        .where((name) => name.toLowerCase().contains(_searchText.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSizing.h16,
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.black6,
                  hintText: 'Search',
                  prefixIcon: const Icon(Iconsax.search_normal_copy),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchText = value;
                    _filterList();
                  });
                },
              ),
              const SizedBox(height: 24.0),
              if (_searchText.isEmpty)
                const Text(
                  'Recent Searches',
                  style: TextStyle(fontSize: 18),
                ),
              if (_searchText.isEmpty) const SizedBox(height: 12.0),

              //! Write code for when user doesn't have a profile pp, use their intials
              Flexible(
                child: ListView.builder(
                  itemCount: _searchText.isEmpty
                      ? userList.length
                      : _filteredUserList.length,
                  itemBuilder: (context, index) {
                    //? Shows filtered list when search is on else default
                    final item = _searchText.isEmpty
                        ? userList[index]
                        : _filteredUserList[index];

                    //? Display initials

                    final initials = userList[index]
                        .split(' ')
                        .map((word) => word.isNotEmpty ? word[0] : '')
                        .join('');
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
                      leading: CircleAvatar(
                        radius: 24,
                        child: Text(initials),
                      ),
                      title: Text(item),
                      trailing: const Icon(
                        Icons.close,
                        size: 22,
                      ),
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
