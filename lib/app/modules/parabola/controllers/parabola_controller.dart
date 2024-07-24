import 'dart:async';
import 'dart:math';
import 'package:get/get.dart';

class ParabolaController extends GetxController {
  final count = 0.obs;

  final RxDouble initialVelocity = 100.0.obs;
  final RxDouble angle = 45.0.obs;
  final RxDouble simulationSpeed = 0.10.obs;

  final RxDouble currentSpeed = 0.0.obs;
  final RxDouble speedX = 0.0.obs;
  final RxDouble speedY = 0.0.obs;

  final RxDouble currentAngle = 0.0.obs;
  final RxDouble timeInSeconds = 0.0.obs;

  final RxBool isPlaying = false.obs;
  final Rx<DateTime> initialDuration = DateTime.now().obs;

  final RxDouble x = 0.0.obs;
  final RxDouble y = 0.0.obs;
  Timer? timer;

  void reset() {
    isPlaying.value = false;
    x.value = 0;
    y.value = 0;
    speedX.value = 0;
    speedY.value = 0;
    currentSpeed.value = 0;
    currentAngle.value = 0;
    timeInSeconds.value = 0;
  }

  void onVelocitySliderChange(double v) {
    initialVelocity.value = v;
  }

  void onAngleSliderChange(double a) {
    angle.value = a;
  }

  void onSpeedSliderChange(double s) {
    simulationSpeed.value = s;
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

    // double timeFromTick =
    //     ((timer.tick - tickCount.value) * (1000 ~/ 60)).toDouble() / 1000;

    timeInSeconds.value = DateTime.now()
            .difference(initialDuration.value)
            .inMilliseconds
            .toDouble() /
        1000;

    // print('$timeInSeconds, '); //$timeFromTick

    timeInSeconds.value = timeInSeconds.value * simulationSpeed.value;

    double radian = angle.value * (pi / 180);

    x.value = initialVelocity.value * cos(radian) * timeInSeconds.value;

    double b = tan(radian);
    double c = 9.80665 /
        (2 *
            (initialVelocity.value * initialVelocity.value) *
            (cos(radian) * cos(radian)));

    y.value = (b * x.value) - (c * (x.value * x.value));

    speedX.value = initialVelocity.value * cos(radian);
    speedY.value =
        (initialVelocity.value * sin(radian)) - (9.80665 * timeInSeconds.value);

    currentSpeed.value =
        sqrt((speedX.value * speedX.value) + (speedY.value * speedY.value));

    final double currentRadian = atan((speedY.value / speedX.value));
    currentAngle.value = currentRadian * (180 / pi);

    // print('time: $timeInSeconds x: ${x.value},y: ${y.value}');
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void togglePlayPause() {
    isPlaying.value = !isPlaying.value;

    if (isPlaying.value) {
      initialDuration.value = DateTime.now();
    }
  }
}
