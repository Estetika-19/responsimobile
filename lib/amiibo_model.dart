class Amiibo {
  final String amiiboSeries;
  final String character;
  final String gameSeries;
  final String head;
  final String tail;
  final String image;
  final String name;
  final String release;

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
      amiiboSeries: json['amiiboSeries'] ?? 0,
      character: json['Character'] ?? "",
      gameSeries: json['gameSeries'] ?? "",
      image: (json['image'] != null && json['image'].isNotEmpty)
          ? json['image'][0]
          : 'https://placehold.co/600x400',
      name: json['name'] ?? "",
      head: json['head'] ?? "",
      tail: json['tail'] ?? "",
      release: json['release'] ?? "",
    );
  }
}
