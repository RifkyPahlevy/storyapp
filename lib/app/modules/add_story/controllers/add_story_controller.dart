import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';
import 'package:story_app/app/data/database/dbmanager.dart';

class AddStoryController extends GetxController {
  TextEditingController judulC = TextEditingController();
  TextEditingController ceritaC = TextEditingController();

  late ImagePicker picker;
  DatabaseManager database = DatabaseManager.instance;
  XFile? imageSelected;

  void resetImage() {
    imageSelected = null;
    update();
  }

  void selectPict() async {
    try {
      final checkPict = await picker.pickImage(source: ImageSource.gallery);

      if (checkPict != null) {
        print(checkPict.path);
        print(checkPict.name);

        imageSelected = checkPict;
        update();
      } else {
        print('No image selected.');
        imageSelected = null;
        update();
      }
    } catch (e) {
      print(e);
    }
  }

  void addStory() async {
    Database db = await database.db;

    if (imageSelected != null &&
        judulC.text.isNotEmpty &&
        ceritaC.text.isNotEmpty) {
      await db.insert("story", {
        "judul": judulC.text,
        "cerita": ceritaC.text,
        "gambar": imageSelected!.path
      });
    }
  }

  @override
  void onInit() {
    picker = ImagePicker();
    super.onInit();
  }
}
