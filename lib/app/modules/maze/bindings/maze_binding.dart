import 'package:get/get.dart';

import '../controllers/maze_controller.dart';

class MazeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MazeController>(
      () => MazeController(),
    );
  }
}
