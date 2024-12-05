class Amiibo {
  final String amiiboSeries;
  final String character;
  final String gameSeries;
  final String head;
  final String tail;
  final String image;
  final String name;
  final Map<String, String> release; // Nested release dates

  Amiibo({
    required this.amiiboSeries,
    required this.character,
    required this.gameSeries,
    required this.head,
    required this.tail,
    required this.image,
    required this.name,
    required this.release,
  });

  factory Amiibo.fromJson(Map<String, dynamic> json) {
    return Amiibo(
      amiiboSeries: json['amiiboSeries'] ?? "",
      character: json['character'] ?? "",
      gameSeries: json['gameSeries'] ?? "",
      head: json['head'] ?? "",
      tail: json['tail'] ?? "",
      image: json['image'] ?? 'https://placehold.co/600x400',
      name: json['name'] ?? "",
      release: json['release'] != null
          ? Map<String, String>.from(json['release'])
          : {},
    );
  }
}
