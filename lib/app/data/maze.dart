import 'dart:math';

class Maze {
  late List<List<int>> grid;
  late int rows, cols;
  late Point<int> start, end;

  Maze() {
    grid = [];
  }

  Maze.generate(this.rows, this.cols) {
    grid = List.generate(rows,
        (_) => List.generate(cols, (_) => 1)); // Initialize the maze with walls
    start = const Point(0, 0); // Set the starting point
    end = Point(rows - 1, cols - 1); // Set the ending point
    grid[start.x][start.y] = 0;
    grid[end.x][end.y] = 0;
    _generateMaze(0, 0);
    _ensureEndAccessible(); // Ensure the end point is always accessible
  }

  void _generateMaze(int r, int c) {
    final directions = [
      [0, 1],
      [1, 0],
      [0, -1],
      [-1, 0]
    ]..shuffle(); // Randomize directions to ensure randomness in maze generation

    for (var direction in directions) {
      final nr = r + direction[0] * 2;
      final nc = c + direction[1] * 2;
      if (nr >= 0 && nr < rows && nc >= 0 && nc < cols && grid[nr][nc] == 1) {
        grid[r + direction[0]][c + direction[1]] = 0; // Carve a path
        grid[nr][nc] = 0; // Move to the new cell
        _generateMaze(nr, nc);
      }
    }
  }

  void _ensureEndAccessible() {
    // Ensure the end point (bottom-right corner) is accessible
    if (grid[rows - 1][cols - 2] == 1 && grid[rows - 2][cols - 1] == 1) {
      grid[rows - 1][cols - 2] =
          0; // Open left cell if both adjacent cells are walls
    }
    if (grid[rows - 2][cols - 1] == 1) {
      grid[rows - 2][cols - 1] = 0; // Ensure the top cell is open
    }
  }
}
