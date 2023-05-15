import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:music_ap_lnx/core/app/music_app_initial_bindings.dart';
import 'package:music_ap_lnx/core/app/music_app_material.dart';
import 'package:music_ap_lnx/features/genre_list_screen.dart';

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: MusicAppMaterial.getTitle,
      theme: MusicAppMaterial.getTheme,
      getPages: MusicAppMaterial.getPages,
      initialRoute: GenreListScreen.routeName,
      initialBinding: MusicAppInitialBindings(),
    );
  }
}
