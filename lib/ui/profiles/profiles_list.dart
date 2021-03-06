import 'package:flutter/material.dart';
import '../../models/profile_model.dart';
import 'profile_item.dart';

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
