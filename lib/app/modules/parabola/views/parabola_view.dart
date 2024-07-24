import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: Get.width),
              Row(
                children: [
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(
                      Icons.restore_rounded,
                      size: 50,
                    ),
                    onPressed: controller.reset,
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: Icon(
                      controller.isPlaying.value
                          ? Icons.pause
                          : Icons.play_arrow,
                      size: 50,
                    ),
                    onPressed: controller.togglePlayPause,
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      SizedBox(
                        width: Get.width * 2 / 3,
                        child: Row(
                          children: [
                            const Text('Velocity: '),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Slider(
                                max: 1000,
                                min: 0,
                                value: controller.velocity.value,
                                onChanged: controller.onVelocitySliderChange,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 2 / 3,
                        child: Row(
                          children: [
                            const Text('Angle: '),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Slider(
                                max: 90,
                                min: 0,
                                value: controller.angle.value,
                                onChanged: controller.onAngleSliderChange,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 2 / 3,
                        child: Row(
                          children: [
                            const Text('Speed: '),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Slider(
                                max: 3,
                                min: 0.001,
                                value: controller.speed.value,
                                onChanged: controller.onSpeedSliderChange,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Velocity: ${controller.velocity.value.toStringAsFixed(2)}, Angle: ${controller.angle.value.toStringAsFixed(2)} Speed: ${controller.speed.value.toStringAsFixed(2)},',
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(30),
                  width: Get.width,
                  color: Colors.lightGreenAccent.withOpacity(0.2),
                  child: Stack(
                    children: [
                      Positioned(
                        left: controller.x.value,
                        bottom: controller.y.value,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
