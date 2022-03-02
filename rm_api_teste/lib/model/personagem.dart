class Personagem{
  final int char_id;
  final String name;
  final String status;
  final String especie;
  final String tipo;
  final String genero;
  final String img;
  final List<dynamic> epsodios;

  const Personagem({
    required this.char_id,
    required this.name,
    required this.status,
    required this.especie,
    required this.tipo,
    required this.genero,
    required this.img,
    required this.epsodios,
  });

  factory Personagem.fromJson(Map<String, dynamic> json){
    return Personagem(
      char_id: json['id'],
      name: json['name'],
      status: json['status'],
      especie: json['species'],
      tipo: json['type'],
      genero: json['gender'],
      img: json['image'],
      epsodios: json['episode'],
    );
  }
}