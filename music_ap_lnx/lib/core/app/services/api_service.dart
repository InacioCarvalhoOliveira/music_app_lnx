import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:music_ap_lnx/shared/models/genre_details_model.dart';
import 'package:music_ap_lnx/shared/models/genre_model.dart';

import '../../errors/exceptions.dart';

class ApiService extends DioForNative {
  ApiService([super.baseOptions]);

  Future<List<GenreModel>> getGenres() async {
    try {
      const endPoint = "/genres";
      final response = await get(endPoint);
      return (response.data as List)
          .map((genre) => GenreModel.fromMap(genre))
          .toList();
    } on DioError catch (dioError, stackTrace) {
      log("erro ao fazer o get dos generos musicais",
          error: dioError, stackTrace: stackTrace);
      throw ApiException(
          message: "erro ao carregar generos",
          statusCode: dioError.response?.statusCode);
    } catch (error, stackTrace) {
      log(
        "erro ao fazer get dos generos musicais",
        error: error,
        stackTrace: stackTrace,
      );
      throw GeneralException();
    }
  }

  Future<GenreDetailsModel> getGenreDetails({required String genre}) async {
    try {
      final endPoint = "/genres/$genre";

      final response = await get(endPoint);

      return GenreDetailsModel.fromMap(response.data);
    } on DioError catch (dioError, stackTrace) {
      log("erro ao fazer o get dos detalhes do genero musical",
          error: dioError, stackTrace: stackTrace);
      throw ApiException(
          message: "erro ao fazer o get dos detalhes do genero musical",
          statusCode: dioError.response?.statusCode);
    } catch (error, stackTrace) {
      log(
        "erro ao fazer o get dos detalhes do genero musical",
        error: error,
        stackTrace: stackTrace,
      );
      throw GeneralException();
    }
  }
}
