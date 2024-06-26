# FlareMaze

FlareMaze is a simple maze game built using Flutter and GetX for state management. The game generates random mazes and allows the player to navigate from the start point to the end point.

## Features

- Generates a random, solvable maze on button press.
- Displays the time taken to solve the maze.
- Swipe gestures to move the player through the maze.

## How to Play

- **Start a new game:** Click the "Start Maze" button to initiate the game.
- **Generate a new randomize maze:** Click the "Generate New Maze" button to generate a new maze.
- **Navigate the maze:** Swipe up, down, left, or right to move the player (red block) through the maze.
- **Complete the maze:** Reach the end point (green block) to complete the maze. The time taken to solve the maze will be displayed.

## Maze Generation Logic

The maze is generated using a depth-first search (DFS) algorithm. The algorithm starts at the top-left corner and carves out a path through the grid, ensuring that all cells are reachable. The bottom-right corner is always accessible to ensure the maze is solvable.

## Dependencies

- Flutter
- GetX

## Author

Hamza Tariq
