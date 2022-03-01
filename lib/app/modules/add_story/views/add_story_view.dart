import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:story_app/app/modules/home/controllers/home_controller.dart';

import '../controllers/add_story_controller.dart';

class AddStoryView extends GetView<AddStoryController> {
  HomeController homeC = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Cerita'),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                controller.addStory();
                homeC.getAllStory();
                Get.back();
              },
              child: Text("Tambah", style: TextStyle(color: Colors.white)))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          GetBuilder<AddStoryController>(
            builder: (c) {
              return Stack(children: [
                Container(
                  height: Get.height * 0.5,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 209, 204, 204),
                  ),
                  child: c.imageSelected != null
                      ? Image.file(
                          File(c.imageSelected!.path),
                          fit: BoxFit.cover,
                        )
                      : Center(
                          child: IconButton(
                              onPressed: () {
                                controller.selectPict();
                              },
                              icon: Icon(Icons.add_a_photo)),
                        ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.delete_rounded),
                    onPressed: () {
                      controller.resetImage();
                    },
                  ),
                ),
              ]);
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: controller.judulC,
            decoration: InputDecoration(
              labelText: "Judul",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: controller.ceritaC,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              labelText: "Cerita Anda",
              border: OutlineInputBorder(),
            ),
            maxLines: 50,
          ),
        ],
      ),
    );
  }
}
