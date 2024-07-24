import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:island/app/routes/app_pages.dart';

import '../controllers/parabola_controller.dart';

class ParabolaView extends GetView<ParabolaController> {
  const ParabolaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  Get.back();
                },
                child: const Icon(Icons.skip_previous_rounded),
              ),
              // SizedBox(width: 20,),
              // FloatingActionButton(
              //   onPressed: () {
              //     Get.offAllNamed(Routes.HOME);
              //   },
              //   child: const Icon(Icons.skip_next_rounded),
              // ),
            ],
          ),
          appBar: AppBar(title: const Text("Parabola")),
          body: Center(
            child: Text(
              controller.count.value.toString(),
              style: const TextStyle(fontSize: 20),
            ),
          ),
        );
      },
    );
  }
}
