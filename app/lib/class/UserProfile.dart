class UserProfile {
  final int id;
  final String? phoneNumber;
  final String? profession;
  final String? bio;

  const UserProfile({
    required this.id,
    this.phoneNumber,
    this.profession,
    this.bio,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: int.parse(json['id']),
      phoneNumber: json['phoneNumber'],
      bio: json['bio'],
      profession: json['profession'],
    );
  }
}
