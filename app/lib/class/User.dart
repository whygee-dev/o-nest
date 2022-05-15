class User {
  final String id;
  final String email;
  final String? fullname;
  final String accessToken;

  const User(
      {required this.id,
      required this.email,
      this.fullname,
      required this.accessToken});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['user']['id'].toString(),
        fullname: json['user']['fullname'],
        email: json['user']['email'],
        accessToken: json['access_token']);
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
