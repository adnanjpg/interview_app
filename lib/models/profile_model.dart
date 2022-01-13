import 'dart:math';

class ProfileModel {
  final String name;
  final String imageUrl;
  final String bgImageUrl;
  final String description;

  const ProfileModel({
    required this.name,
    required this.imageUrl,
    required this.bgImageUrl,
    required this.description,
  });

  ProfileModel.random()
      : name = lipsumWords(2),
        description = lipsumWords(15),
        imageUrl = 'https://thispersondoesnotexist.com/image',
        bgImageUrl = 'https://picsum.photos/800/450';
}

final lipsumArr = ['lorem', 'ipsum', 'sit', 'amed'];

final _ran = Random.secure();
String lipsumWords(int count) {
  return List.generate(
    count,
    (index) {
      return lipsumArr[_ran.nextInt(lipsumArr.length)];
    },
  ).join(' ');
}
