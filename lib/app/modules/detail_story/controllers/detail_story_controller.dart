import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:story_app/app/data/database/dbmanager.dart';

class DetailStoryController extends GetxController {
  TextEditingController judulC = TextEditingController();
  TextEditingController ceritaC = TextEditingController();
  DatabaseManager database = DatabaseManager.instance;

  void editStory(int id) async {
    Database db = await database.db;

    db.update("story", {"judul": judulC.text, "cerita": ceritaC.text},
        where: "id = ?", whereArgs: [id]);
  }
}
