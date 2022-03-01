import 'package:get/get.dart';

import '../controllers/detail_story_controller.dart';

class DetailStoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailStoryController>(
      () => DetailStoryController(),
    );
  }
}
