class Doa {
  final int number;
  final String name;
  final String arabic;
  final String latin;
  final String translation;

  Doa({
    required this.number,
    required this.name,
    required this.arabic,
    required this.latin,
    required this.translation,
  });

  factory Doa.fromJson(Map<String, dynamic> json) {
    return Doa(
      number: json['number'],
      name: json['name'],
      arabic: json['arabic'],
      latin: json['latin'],
      translation: json['translation'],
    );
  }
}
