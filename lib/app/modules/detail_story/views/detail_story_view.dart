import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:story_app/app/data/models/story_model.dart';
import 'package:story_app/app/modules/home/controllers/home_controller.dart';

import '../controllers/detail_story_controller.dart';

class DetailStoryView extends GetView<DetailStoryController> {
  Story story = Get.arguments;
  HomeController homeC = Get.find();
  @override
  Widget build(BuildContext context) {
    controller.ceritaC.text = story.cerita!;
    controller.judulC.text = story.judul!;

    return Scaffold(
      appBar: AppBar(
        title: Text(story.judul!),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                controller.editStory(story.id!);
                homeC.getAllStory();
                Get.back();
              },
              icon: Icon(Icons.edit))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Container(
            width: Get.width,
            height: Get.height * 0.3,
            child: Image.file(
              File(story.gambar!),
              fit: BoxFit.cover,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: controller.ceritaC,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            maxLines: 50,
          ),
        ],
      ),
    );
  }
}
