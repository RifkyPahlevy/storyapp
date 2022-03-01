import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:story_app/app/data/database/dbmanager.dart';

import '../../../data/models/story_model.dart';

class HomeController extends GetxController {
  RxList allStory = <Story>[].obs;
  DatabaseManager database = DatabaseManager.instance;

  Future<void> getAllStory() async {
    Database db = await database.db;
    List<Map<String, dynamic>> dataStory = await db.query("story");

    if (dataStory != null) {
      allStory(Story.fromJsonList(dataStory));
      allStory.refresh();
    } else {
      allStory.clear();
      allStory.refresh();
    }
  }

  void deleteStory(int id) async {
    Database db = await database.db;
    db.delete("story", where: "id = ?", whereArgs: [id]);
  }
}
