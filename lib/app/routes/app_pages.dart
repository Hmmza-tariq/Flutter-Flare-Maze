import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/maze/bindings/maze_binding.dart';
import '../modules/maze/views/maze_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.MAZE,
      page: () => const MazeView(),
      binding: MazeBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
