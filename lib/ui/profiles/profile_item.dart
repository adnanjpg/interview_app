import 'package:flutter/material.dart';
import '../../models/profile_model.dart';
import '../../utils/utils.dart';

class ProfileItem extends StatelessWidget {
  final ProfileModel model;
  const ProfileItem(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Builder(
              builder: (context) {
                const siz = 50.0;
                return Stack(
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.network(
                            model.bgImageUrl,
                          ),
                        ),
                        const SizedBox(height: siz / 2),
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: siz,
                      child: CircleAvatar(
                        foregroundImage: NetworkImage(
                          model.imageUrl,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: defPaddingSize,
              ),
              child: Column(
                children: [
                  Text(
                    model.description,
                    maxLines: 3,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // fromHeight use double.infinity as width and 40 is the height
                      minimumSize: const Size.fromHeight(40),
                    ),
                    onPressed: () {},
                    child: Text(
                      getStr('follow'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
