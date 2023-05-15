import 'package:flutter_dotenv/flutter_dotenv.dart';

class DotEnvService {
  DotEnvService._();

  static String get getApiBaseurl => dotenv.env["API_BASE_URL"] as String;
}
