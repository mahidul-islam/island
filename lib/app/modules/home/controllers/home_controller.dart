import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final GlobalKey widget1Key = GlobalKey();
  final GlobalKey widget2Key = GlobalKey();
  final GlobalKey widget3Key = GlobalKey();
  final GlobalKey customPaintKey = GlobalKey();

  RxList<Offset?> points = <Offset?>[].obs;

  @override
  void onReady() async {
    super.onReady();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      calculatePositions();
    });
  }

  void calculatePositions() {
    points.value = [
      _getWidgetPosition(widget1Key),
      _getWidgetPosition(widget2Key),
      _getWidgetPosition(widget3Key),
    ];
  }

  Offset? _getWidgetPosition(GlobalKey key) {
    final RenderBox? renderBox =
        key.currentContext?.findRenderObject() as RenderBox?;
    Offset? offset = renderBox?.localToGlobal(Offset.zero);
    // print(offset.toString());
    return offset;
  }
}
