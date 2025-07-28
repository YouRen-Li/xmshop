import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/services/keepAliveWrapper.dart';

import '../controllers/home_controller.dart';
import '../../../services/screenAdapter.dart';
import '../../../services/fontsIcon.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
      child: Obx(
        () => Scaffold(
          body: Stack(
            children: [
              Positioned(
                top: -40,
                left: 0,
                right: 0,
                bottom: 0,
                child: ListView.builder(
                  controller: controller.scrollController, //绑定控制器
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return SizedBox(
                        width: Screenadapter.width(1080),
                        height: Screenadapter.height(662),
                        child: Image.network(
                          'https://www.itying.com/images/focus/focus02.png',
                          fit: BoxFit.cover,
                        ),
                      );
                    } else {
                      return ListTile(title: Text('第${index}个列表'));
                    }
                  },
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AppBar(
                  centerTitle: true,
                  backgroundColor: controller.flag.value
                      ? Colors.white
                      : Colors.transparent,
                  elevation: 0,
                  leading: controller.flag.value
                      ? Text('')
                      : Icon(FontsIcon.xiaomi, color: Colors.white),
                  leadingWidth: controller.flag.value
                      ? Screenadapter.width(20)
                      : Screenadapter.width(140),
                  title: AnimatedContainer(
                    width: controller.flag.value
                        ? Screenadapter.width(800)
                        : Screenadapter.width(620),
                    height: Screenadapter.height(96),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(230, 252, 243, 236),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    duration: Duration(milliseconds: 600),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsGeometry.fromLTRB(
                            Screenadapter.width(34),
                            0,
                            Screenadapter.width(10),
                            0,
                          ),
                          child: Icon(Icons.search),
                        ),
                        Text(
                          '手机',
                          style: TextStyle(
                            fontSize: Screenadapter.fontsize(32),
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.qr_code,
                        color: controller.flag.value
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.message,
                        color: controller.flag.value
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
