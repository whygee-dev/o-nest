import 'UserProfile.dart';

class User {
  final String id;
  final String email;
  final String? fullname;
  final String? accessToken;
  final UserProfile? profile;

  const User(
      {required this.id,
      required this.email,
      this.fullname,
      this.accessToken,
      this.profile});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'].toString(),
      fullname: json['user']['fullname'],
      email: json['user']['email'],
      accessToken: json['access_token'],
      profile: json["profile"] != null
          ? UserProfile.fromJson(json["profile"])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      "user": {
        'id': id,
        'email': email,
      },
      "access_token": accessToken,
    };

    if (fullname != null) {
      json["user"]["fullname"] = fullname;
    }

    return json;
  }
}
