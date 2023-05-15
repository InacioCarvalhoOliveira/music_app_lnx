import 'package:flutter/material.dart';

class ApiException implements Exception {
  late final String message;
  late final int? statusCode;

  ApiException({
    required this.message,
    this.statusCode,
    int? statuscode,
  });
}

class GeneralException implements Exception {
  final String message;

  GeneralException({
    this.message = "occoreu um erro. por favor tente novamente",
  });
}

class AudioPlayerException implements Exception {
  final String message;

  AudioPlayerException({required this.message});
}
