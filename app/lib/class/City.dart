class City {
  final int code;
  final int id;
  final String name;
  final double x;
  final double y;

  const City({
    required this.code,
    required this.id,
    required this.name,
    required this.x,
    required this.y,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      code: json['code'],
      x: json['x'],
      y: json['y'],
      name: json["name"],
    );
  }
}
