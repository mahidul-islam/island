import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:island/app/modules/home/widget/line.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(title: const Text("Line Between Widgets")),
        body: Stack(
          children: [
            CustomPaint(
              size: Size.infinite,
              painter: LinePainter(
                points: controller.points,
                repaint: controller.points.reactive,
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
      );
    });
  }
}
