import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/services/keepAliveWrapper.dart';
import '../controllers/home_controller.dart';
import '../../../services/screenAdapter.dart';
import '../../../services/fontsIcon.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  // 顶部导航
  Widget _appBar() {
    return Positioned(
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
              color: controller.flag.value ? Colors.black : Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.message,
              color: controller.flag.value ? Colors.black : Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  //轮播图
  Widget _focus() {
    return SizedBox(
      width: Screenadapter.width(1080),
      height: Screenadapter.height(682),
      child: Obx(
        () => Swiper(
          itemBuilder: (context, index) {
            return Image.network(
              "${controller.swiperList[index].pic}",
              fit: BoxFit.fill,
            );
          },
          itemCount: controller.swiperList.length,
          pagination: const SwiperPagination(builder: SwiperPagination.rect),
          autoplay: true,
          loop: true,
        ),
      ),
    );
  }

  //banner 下划线代表私有的
  Widget _Banner() {
    return SizedBox(
      width: Screenadapter.width(1080),
      height: Screenadapter.height(92),
      child: Image.asset("assets/images/xiaomiBanner.png", fit: BoxFit.cover),
    );
  }

  //顶部滑动分类
  Widget _categoty() {
    return SizedBox(
      width: Screenadapter.width(1080),
      height: Screenadapter.height(470),
      child: Obx(
        () => Swiper(
          itemCount: (controller.categoryList.length / 10).ceil(), //向上取整
          itemBuilder: (context, index) {
            return GridView.builder(
              itemCount: 10, //一页一共多少个元素
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5, //一行5个元素
                crossAxisSpacing: Screenadapter.width(20), //左右间距
                mainAxisSpacing: Screenadapter.height(20), //上下间距
              ),
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: Screenadapter.height(140),
                      height: Screenadapter.height(140),
                      child: Image.network(
                        '${controller.categoryList[index * 10 + i].pic}',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsGeometry.fromLTRB(
                        0,
                        Screenadapter.height(5),
                        0,
                        0,
                      ),
                      // 这里的分页采取了一个简单的算法
                      // pageview第一个页面是索引是0，0*10,就是索引乘以每页展示的数据
                      // 0*10=0+i,i是itemBuild展示的数据，展示10个。所以第一页就展示10个数据 0-9
                      // 第二个页面，索引是1，1*10+i。这个时候数据就从10开始，展示10个数据。10-19
                      // i是10，数据是不变，每页展示的10条数据不变，变化的只有从第多少条数据开始加载
                      child: Text(
                        '${controller.categoryList[index * 10 + i].title}',
                        style: TextStyle(fontSize: Screenadapter.fontsize(34)),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          //自定义轮播图圆点
          pagination: SwiperPagination(
            margin: EdgeInsets.all(0.0),
            builder: SwiperCustomPagination(
              builder: (BuildContext context, SwiperPluginConfig config) {
                return ConstrainedBox(
                  constraints: BoxConstraints.expand(
                    height: Screenadapter.height(20),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: const RectSwiperPaginationBuilder(
                            color: Colors.black12,
                            activeColor: Colors.black54,
                          ).build(context, config),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  // 内容区域
  Widget _homePage() {
    return Positioned(
      top: -40,
      left: 0,
      right: 0,
      bottom: 0,
      child: ListView(
        controller: controller.scrollController,
        children: [_focus(), _Banner(), _categoty()],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
      child: Obx(
        () => Scaffold(body: Stack(children: [_homePage(), _appBar()])),
      ),
    );
  }
}
