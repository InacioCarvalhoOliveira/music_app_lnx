import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:music_ap_lnx/core/app/music_app.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');

  runApp(const MusicApp());
}
