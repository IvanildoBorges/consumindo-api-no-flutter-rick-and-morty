class Episode{
  final int id;
  final String name;
  final String lancado;
  final String episode;
  final List<dynamic> personagens;

  const Episode({
    required this.id,
    required this.name,
    required this.lancado,
    required this.episode,
    required this.personagens,
  });

  factory Episode.fromJson(Map<String, dynamic> json){
    return Episode(
      id: json['id'],
      name: json['name'],
      lancado: json['air_date'],
      episode: json['episode'],
      personagens: json['characters'],
    );
  }
}