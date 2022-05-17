import 'AnimalType.dart';

class Animal {
  final int id;
  final String name;
  final int age;
  final AnimalType type;
  final String bio;
  final List<String> photos;

  const Animal({
    required this.id,
    required this.name,
    required this.age,
    required this.type,
    required this.bio,
    required this.photos,
  });

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      id: json['id'],
      bio: json["bio"],
      name: json['name'],
      age: json['age'],
      type: json["type"] == "CAT" ? AnimalType.CAT : AnimalType.DOG,
      photos: json["photos"].cast<String>(),
    );
  }
}
