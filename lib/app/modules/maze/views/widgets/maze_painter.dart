import 'dart:math';
import 'package:flutter/material.dart';

class MazePainter extends CustomPainter {
  final List<List<int>> grid;
  final Point<int> playerPosition;
  final Point<int> start;
  final Point<int> end;

  MazePainter(this.grid, this.playerPosition, this.start, this.end);

  @override
  void paint(Canvas canvas, Size size) {
    if (grid.isEmpty || grid[0].isEmpty) {
      return;
    }

    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0;

    final cellWidth = size.width / grid[0].length;
    final cellHeight = size.height / grid.length;

    for (var r = 0; r < grid.length; r++) {
      for (var c = 0; c < grid[r].length; c++) {
        if (grid[r][c] == 1) {
          canvas.drawRect(
            Rect.fromLTWH(c * cellWidth, r * cellHeight, cellWidth, cellHeight),
            paint,
          );
        }
      }
    }

    // Draw the start point
    final startPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    canvas.drawRect(
      Rect.fromLTWH(
        start.y * cellWidth,
        start.x * cellHeight,
        cellWidth,
        cellHeight,
      ),
      startPaint,
    );

    // Draw the end point
    final endPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    canvas.drawRect(
      Rect.fromLTWH(
        end.y * cellWidth,
        end.x * cellHeight,
        cellWidth,
        cellHeight,
      ),
      endPaint,
    );

    // Draw the player
    final playerPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    canvas.drawRect(
      Rect.fromLTWH(
        playerPosition.y * cellWidth,
        playerPosition.x * cellHeight,
        cellWidth,
        cellHeight,
      ),
      playerPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
