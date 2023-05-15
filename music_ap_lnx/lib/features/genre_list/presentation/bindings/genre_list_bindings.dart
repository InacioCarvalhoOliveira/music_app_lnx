import 'package:get/get.dart';
import 'package:music_ap_lnx/features/genre_list/presentation/controllers/genre_list_controller.dart';

class GenreListBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(GenreListController());
  }
}
