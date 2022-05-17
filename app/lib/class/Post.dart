import 'Address.dart';
import 'Animal.dart';
import 'City.dart';
import 'User.dart';

class Post {
  final String description;
  final int id;
  final User user;
  final double price;
  final DateTime createdAt;
  final DateTime startDate;
  final DateTime endDate;
  final City city;
  final Address address;
  final Animal animal;

  const Post({
    required this.description,
    required this.id,
    required this.user,
    required this.price,
    required this.createdAt,
    required this.startDate,
    required this.endDate,
    required this.city,
    required this.address,
    required this.animal,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      description: json["description"],
      price: json["price"].toDouble(),
      createdAt: DateTime.parse(json["createdAt"]),
      startDate: DateTime.parse(json["startDate"]),
      endDate: DateTime.parse(json["endDate"]),
      user: User.fromJson(json),
      city: City.fromJson(json["city"]),
      address: Address.fromJson(json["address"]),
      animal: Animal.fromJson(json["animal"]),
    );
  }
}
