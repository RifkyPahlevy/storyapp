import 'package:get/get.dart';

import 'package:story_app/app/modules/add_story/bindings/add_story_binding.dart';
import 'package:story_app/app/modules/add_story/views/add_story_view.dart';
import 'package:story_app/app/modules/detail_story/bindings/detail_story_binding.dart';
import 'package:story_app/app/modules/detail_story/views/detail_story_view.dart';
import 'package:story_app/app/modules/home/bindings/home_binding.dart';
import 'package:story_app/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_STORY,
      page: () => AddStoryView(),
      binding: AddStoryBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_STORY,
      page: () => DetailStoryView(),
      binding: DetailStoryBinding(),
    ),
  ];
}
