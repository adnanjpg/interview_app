import 'package:flutter/material.dart';
import 'package:interview/models/profile_model.dart';
import 'package:interview/ui/profiles/profile_item.dart';
import 'package:interview/utils/utils.dart';

class ProfilesList extends StatelessWidget {
  const ProfilesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final personsList = List.generate(
      10,
      (e) {
        return ProfileModel.random();
      },
    );
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: personsList.length,
        itemBuilder: (context, idx) {
          final p = personsList[idx];

          return ProfileItem(p);
        },
      ),
    );
  }
}
