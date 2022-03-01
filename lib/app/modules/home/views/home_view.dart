import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:story_app/app/routes/app_pages.dart';

import '../../../data/models/story_model.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Cerita'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: controller.getAllStory(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Obx((() => (controller.allStory.length == 0)
              ? Center(
                  child: Text("Belum Ada Cerita nih ..."),
                )
              : ListView.builder(
                  padding: EdgeInsets.all(20),
                  itemCount: controller.allStory.length,
                  itemBuilder: (context, index) {
                    Story story = controller.allStory[index];
                    return Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onLongPress: () {
                              Get.defaultDialog(
                                title: "Hapus Cerita",
                                middleText:
                                    "Anda yakin ingin menghapus cerita ini?",
                                onConfirm: () {
                                  controller.deleteStory(story.id!);
                                  controller.getAllStory();
                                  Get.back();
                                },
                              );
                            },
                            onTap: () => Get.toNamed(Routes.DETAIL_STORY,
                                arguments: story),
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10, top: 10),
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.bottomLeft,
                              width: Get.width,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: FileImage(File(story.gambar!)),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Text(story.judul!,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    );
                  },
                )));
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Routes.ADD_STORY);
          },
          child: Icon(Icons.add)),
    );
  }
}
