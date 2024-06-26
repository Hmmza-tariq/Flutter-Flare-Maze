import 'package:flare_maze/app/modules/maze/views/widgets/maze_painter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/maze_controller.dart';

class MazeView extends GetView<MazeController> {
  const MazeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.deepPurple, Colors.orangeAccent],
            ),
          ),
          child: GestureDetector(
            onVerticalDragUpdate: (details) {
              if (details.delta.dy > 0) {
                controller.movePlayer(1, 0);
              } else if (details.delta.dy < 0) {
                controller.movePlayer(-1, 0);
              }
            },
            onHorizontalDragUpdate: (details) {
              if (details.delta.dx > 0) {
                controller.movePlayer(0, 1);
              } else if (details.delta.dx < 0) {
                controller.movePlayer(0, -1);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Obx(() => Text.rich(
                        TextSpan(
                          text: 'Time taken: ',
                          style: const TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 20.0,
                              color: Colors.white),
                          children: [
                            TextSpan(
                              text:
                                  '${controller.timeTaken.value.inSeconds} seconds',
                              style: const TextStyle(
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      )),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Obx(() {
                    final maze = controller.maze.value;
                    final playerPosition = controller.playerPosition.value;
                    if (maze.grid.isEmpty) {
                      return const CircularProgressIndicator();
                    }
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 20.0),
                      ),
                      child: CustomPaint(
                        size: const Size(300, 300),
                        painter: MazePainter(
                            maze.grid, playerPosition, maze.start, maze.end),
                      ),
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () => controller.generateNewMaze(15, 15),
                    child: const Text('Generate New Maze'),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: Get.height * .08,
          left: Get.width * .08,
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.5),
              child: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: Colors.white, size: 24.0),
            ),
          ),
        ),
        Positioned(
          top: Get.height * .08,
          right: Get.width * .08,
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: InkWell(
              onTap: () {
                Get.defaultDialog(
                  backgroundColor: Colors.black.withOpacity(0.8),
                  title: 'Instructions',
                  titleStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  content: const Text(
                      'Swipe up, down, left, or right to move the player through the maze. Reach the green block to complete the maze!',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white)),
                  actions: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        'Close',
                      ),
                    ),
                  ],
                );
              },
              child: CircleAvatar(
                backgroundColor: Colors.black.withOpacity(0.5),
                child: const Icon(Icons.question_mark_rounded,
                    color: Colors.white, size: 24.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
