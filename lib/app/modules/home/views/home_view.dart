import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:island/app/modules/home/widget/line.dart';
import 'package:island/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                Get.toNamed(Routes.PARABOLA);
              },
              child: const Icon(Icons.skip_next_rounded),
            ),
          ],
        ),
        appBar: AppBar(title: const Text("Line Between Widgets")),
        body: SingleChildScrollView(
          controller: controller.scrollController,
          child: Column(
            children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.redAccent,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.amberAccent,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.redAccent,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.amberAccent,
              ),
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.amberAccent,
                  ),
                  Container(
                    color: Colors.amberAccent.withOpacity(0.3),
                    height: 300,
                    width: 400,
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: CustomPaint(
                            key: controller.customPaintKey,
                            size: Size.infinite,
                            painter: LinePainter(
                              key: controller.customPaintKey,
                              points: controller.points,
                              repaint: controller.points.reactive,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 50,
                          top: 100,
                          child: Container(
                            key: controller.widget1Key,
                            width: 50,
                            height: 50,
                            color: Colors.red,
                          ),
                        ),
                        Positioned(
                          left: 200,
                          top: 200,
                          child: Container(
                            key: controller.widget2Key,
                            width: 50,
                            height: 50,
                            color: Colors.green,
                          ),
                        ),
                        Positioned(
                          left: 250,
                          top: 100,
                          child: Container(
                            key: controller.widget3Key,
                            width: 50,
                            height: 50,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.redAccent,
                  ),
                ],
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.redAccent,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.amberAccent,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.redAccent,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.amberAccent,
              ),
            ],
          ),
        ),
      );
    });
  }
}
