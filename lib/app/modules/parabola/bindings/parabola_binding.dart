import 'package:get/get.dart';

import '../controllers/parabola_controller.dart';

class ParabolaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ParabolaController>(
      () => ParabolaController(),
    );
  }
}
