import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/category_controller.dart';

import '../../../services/screenAdapter.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CategoryView'),
        centerTitle: true,
      ),
      body:Column(
        children: [
          Container(
            width: Screenadapter.width(1080),
            height: Screenadapter.heigth(600),
            color: Colors.yellow,
          )
        ],
      )
    );
  }
}
