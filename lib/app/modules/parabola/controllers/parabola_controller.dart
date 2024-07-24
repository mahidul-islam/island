import 'dart:async';
import 'dart:math';
import 'package:get/get.dart';

class ParabolaController extends GetxController {
  final count = 0.obs;

  final RxDouble velocity = 100.0.obs;
  final RxDouble angle = 45.0.obs;
  final RxDouble speed = 1.0.obs;

  final RxInt tickCount = 0.obs;
  final RxBool isPlaying = false.obs;

  final RxDouble x = 0.0.obs;
  final RxDouble y = 0.0.obs;
  Timer? timer;

  void reset() {
    isPlaying.value = false;
    x.value = 0;
    y.value = 0;
  }

  void onVelocitySliderChange(double v) {
    velocity.value = v;
  }

  void onAngleSliderChange(double a) {
    angle.value = a;
  }

  void onSpeedSliderChange(double s) {
    speed.value = s;
  }

  @override
  void onInit() {
    timer = Timer.periodic((1000 ~/ 60).milliseconds, (Timer timer) {
      updateTimer(timer);
    });
    x.value = 0.0;
    y.value = 0.0;
    super.onInit();
  }

  void updateTimer(Timer timer) {
    if (isPlaying.value == false) {
      return;
    }

    if (y.value < 0) {
      return;
    }

    double time =
        ((timer.tick - tickCount.value) * (1000 ~/ 60)).toDouble() / 1000;

    time = time * speed.value;

    double radian = angle.value * (pi / 180);

    x.value += (velocity.value * cos(radian)) * time;

    double b = tan(radian);
    double c = (9.80665) /
        ((velocity.value * velocity.value) * (cos(radian) * cos(radian)));

    y.value = (b * x.value) - (c * (x.value * x.value));

    // print('x: ${x.value},y: ${y.value}');
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void togglePlayPause() {
    isPlaying.value = !isPlaying.value;

    if (isPlaying.value) {
      tickCount.value = timer?.tick ?? 0;
    }
  }
}
