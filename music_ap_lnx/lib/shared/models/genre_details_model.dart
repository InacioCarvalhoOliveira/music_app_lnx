import 'package:music_ap_lnx/shared/models/genre_model.dart';

import 'music_model.dart';

class GenreDetailsModel extends GenreModel {
  final List<MusicModel> musics;

  //TODO construtor simples
  GenreDetailsModel({
    required super.title,
    super.img,
    required this.musics,
    required super.searchString,
  });

  factory GenreDetailsModel.fromMap(Map<String, dynamic> map) {
    return GenreDetailsModel(
        title: map['title'] ?? '',
        img: map['img'] ?? '',
        musics: (map['musics'] as List)
            .map((music) => MusicModel.fromMap(music))
            .toList(),
        searchString: map['searchString'] ?? '');
  }
}
