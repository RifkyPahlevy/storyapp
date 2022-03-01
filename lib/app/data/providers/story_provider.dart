import 'package:get/get.dart';

import '../models/story_model.dart';

class StoryProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Story.fromJson(map);
      if (map is List) return map.map((item) => Story.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Story?> getStory(int id) async {
    final response = await get('story/$id');
    return response.body;
  }

  Future<Response<Story>> postStory(Story story) async =>
      await post('story', story);
  Future<Response> deleteStory(int id) async => await delete('story/$id');
}
