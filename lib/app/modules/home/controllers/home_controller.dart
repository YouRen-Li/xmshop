import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/models/category_model.dart';
import 'package:xmshop/app/models/focus_model.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();
  //接口列表
  RxList<FocusItemModel> swiperList = <FocusItemModel>[].obs;
  RxList<CategoryItemModel> categoryList = <CategoryItemModel>[].obs;

  //浮动导航的样式
  final flag = false.obs;

  @override
  void onInit() {
    super.onInit();
    scrollControllerListener();
    //请求接口
    getFocusData();
    getCategoryData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // 滚动到一定距离以后搜索框样式改变
  scrollControllerListener() {
    scrollController.addListener(() {
      //监听滚动的距离
      if (scrollController.position.pixels > 10) {
        if (flag == false) flag.value = true;
      } else if (scrollController.position.pixels < 10) {
        if (flag == true) flag.value = false;
      }
    });
  }

  // 获取轮播图
  getFocusData() async {
    var response = await Dio().get('https://miapp.itying.com/api/focus');
    var focus = FocusModel.fromJson(response.data);
    swiperList.value = focus.result!;
    for (int i = 0; i < swiperList.length; i++) {
      swiperList[i].pic = "https://miapp.itying.com/${swiperList[i].pic}"
          .replaceAll("\\", '/');
    }
  }

  // 获取分类
  getCategoryData() async {
    var response = await Dio().get('https://miapp.itying.com/api/bestCate');
    var category = CategoryModel.fromJson(response.data);
    categoryList.value = category.result!;
    for (int i = 0; i < categoryList.length; i++) {
      categoryList[i].pic = "https://miapp.itying.com/${categoryList[i].pic}"
          .replaceAll("\\", '/'); //把\转换为/，需要转义所以是\\
    }
  }
}
