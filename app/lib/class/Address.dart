class Address {
  final int id;
  final String text;
  final double x;
  final double y;

  const Address({
    required this.id,
    required this.text,
    required this.x,
    required this.y,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      text: json['text'],
      x: json['x'],
      y: json['y'],
    );
  }
}
