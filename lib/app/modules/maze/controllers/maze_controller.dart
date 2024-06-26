import 'package:flare_maze/app/data/maze.dart';
import 'package:get/get.dart';
import 'dart:math';

class MazeController extends GetxController {
  final maze = Maze().obs;
  var playerPosition = const Point(0, 0).obs;
  var startTime = DateTime.now().obs;
  var timeTaken = const Duration().obs;
  RxBool timerRunning = false.obs;

  @override
  void onInit() {
    super.onInit();
    generateNewMaze(
        15, 15); // Generate a new maze when the controller is initialized
  }

  void generateNewMaze(int rows, int cols) {
    maze.value = Maze.generate(rows, cols);
    playerPosition.value =
        maze.value.start; // Reset player position to the start
    startTime.value = DateTime.now(); // Start the timer
    timerRunning.value = true;
    updateTimer(); // Continuously update the timer
  }

  void updateTimer() async {
    while (timerRunning.value) {
      await Future.delayed(const Duration(seconds: 1));
      timeTaken.value =
          DateTime.now().difference(startTime.value); // Update time taken
    }
  }

  void movePlayer(int dx, int dy) {
    final newPos =
        Point(playerPosition.value.x + dx, playerPosition.value.y + dy);
    if (newPos.x >= 0 &&
        newPos.x < maze.value.rows &&
        newPos.y >= 0 &&
        newPos.y < maze.value.cols &&
        maze.value.grid[newPos.x][newPos.y] == 0) {
      playerPosition.value = newPos; // Update player position
      if (newPos == maze.value.end) {
        timerRunning.value = false; // Stop the timer when the maze is completed
        Get.snackbar('Congratulations!',
            'You have completed the maze in ${timeTaken.value.inSeconds + 1} seconds!');
      }
    }
  }
}
