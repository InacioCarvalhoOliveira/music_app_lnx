//import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:music_ap_lnx/core/app/services/audio_player_service.dart';
//import 'dart:developer';
import '../../errors/exceptions.dart';

// TUDO o que AudioPlayerService tiver AudioPlayerServiceImpl devera ter
//pois AudioPlayerService é uma interface
class AudioPlayerServiceImpl extends GetxService implements AudioPlayerService {
  final AudioPlayer audioPlayer;

  AudioPlayerServiceImpl(this.audioPlayer);

  @override
  Future<int> get getCurrentPosition async {
    callAudioPlayerServiceTryAndCatchFuncion(
      () => audioPlayer.getCurrentPosition(),
      "erro ao pegar posicao da musica",
    );
    throw AudioPlayerException(message: "erro ao pegar posicao da musica");
  }

  @override
  Stream<Duration> getPositionStream() {
    return audioPlayer.onPositionChanged;
  }

  @override
  Stream<void> onAudioComplete() {
    return audioPlayer.onPlayerComplete;
  }

  @override
  Future<void> pauseMusic() {
    return callAudioPlayerServiceTryAndCatchFuncion(
      () => audioPlayer.pause(),
      "erro ao pausar a musica",
    );
  }

  @override
  Future<void> playMusic(String audioAsset) {
    return callAudioPlayerServiceTryAndCatchFuncion(
        () => audioPlayer.play(AssetSource(audioAsset)),
        "erro ao carregar a musica");
  }

  @override
  Future<void> resumeMusic() {
    return callAudioPlayerServiceTryAndCatchFuncion(
      () => audioPlayer.resume(),
      "erro ao continuar musica",
    );
  }

  Future<void> callAudioPlayerServiceTryAndCatchFuncion(
      Future<void> Function() tryFunction,
      String audioPlayerExceptionMessage) async {
    try {
      await tryFunction();
    // ignore: unused_catch_stack
    } catch (error, stackTrace) {
      final errMessage = audioPlayerExceptionMessage;
      //log (errMessage, error: error, stackTrace: stackTrace);

      throw AudioPlayerException(message: errMessage);
    }
  }

  @override
  Future<void> seek(int seconds) {
    return callAudioPlayerServiceTryAndCatchFuncion(
      () {
        final seekTo = Duration(seconds: seconds);

        return audioPlayer.seek(seekTo);
      },
      "erro ao trocar duracao da musica",
    );
  }

  @override
  Future<void> stopMusic() {
    return callAudioPlayerServiceTryAndCatchFuncion(
        () => audioPlayer.stop(), "erro ao parar a musica");
  }

  @override
  void onClose() {
    audioPlayer
      ..stop()
      ..dispose();
    super.onClose();
  }
}
