class GenreModel {
  //TODO mapear os objetos da api para serem consumidos 
  final String? img;
  final String title;
  final String searchString;

  //TODO construtor padrao
  GenreModel({
    this.img,
    required this.title,
    required this.searchString,
  });
  //TODO traduzir o mapa da api para a classe(construtor personalizado)
  factory GenreModel.fromMap(Map<String, dynamic> map) {
    return GenreModel(
        img: map['img'],
        title: map['title'] ?? '',
        searchString: map['searchString'] ?? '');
  }

}
