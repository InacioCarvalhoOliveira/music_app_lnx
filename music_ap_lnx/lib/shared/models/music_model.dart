import 'package:dartz/dartz_streaming.dart';

class MusicModel {
  //TODO mapear os objetos da api para serem consumidos
  final String? img;
  final String title;
  final String path;
  final int duration;

  //TODO construtor padrao
  MusicModel({
    this.img,
    required this.title,
    required this.path,
    required this.duration,
  });
  //TODO construtor customizado
  factory MusicModel.fromMap(Map<String, dynamic> map) {
    return MusicModel(
        img: map['img'],
        title: map['title'] ?? '',
        path: map['path'] ?? '',
        duration: map['duration'] ?? 0);
  }
}
