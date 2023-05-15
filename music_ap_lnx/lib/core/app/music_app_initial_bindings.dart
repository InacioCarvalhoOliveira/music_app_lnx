import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:music_ap_lnx/core/app/services/dot_env_service.dart';
import 'package:music_ap_lnx/shared/features/music_app/presentation/controllers/music_player_controller.dart';

import 'services/api_service.dart';
import 'services/audio_player_service_impl.dart';

class MusicAppInitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiService(BaseOptions(
      baseUrl : DotEnvService.getApiBaseurl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout:  const Duration(seconds: 10),
    )));
    //esta eh uma dependencia que podera ser recuperada depois ao acessar 
    //get.find
    Get.put(AudioPlayerServiceImpl(AudioPlayer(),),);
    Get.lazyPut(() => MusicPlayerController());
    //eh chamado somente quando é clicado na musica selecionada, sendo 
    //utilizado tanto no miniply quanto no expandido
  }
}
