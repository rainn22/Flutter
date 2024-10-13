enum Direction { north, east, south, west }
//Direction index 0, 1, 2, 3
 
void main() {
  // Initial position {7, 3} and facing north
  int x = 7;
  int y = 3;
  Direction direction = Direction.north;

  // Example instruction sequence
  const instructions = "RAALAL";

  // Process the instructions and get the final position and direction
  void advance() {
    switch (direction){
      case Direction.north:
        y++;
        break;
      case Direction.south:
        y--;
        break;
      case Direction.east:
        x++;
        break;
      case Direction.west:
        x--;
        break;
    }
  }
  
  void turnLeft() {
    direction = Direction.values[(direction.index - 1 + 4) % 4];
  }

    void turnRight() {
    direction = Direction.values[(direction.index + 1 ) % 4];
  }
  // void turnLeft() {
  //   switch (direction){
  //     case Direction.north:
  //       direction = Direction.west;
  //       break;
  //     case Direction.south:
  //       direction = Direction.east;
  //       break;
  //     case Direction.east:
  //       direction = Direction.north;
  //       break;
  //     case Direction.west:
  //       direction = Direction.south;
  //       break;
  //   }
  // }
  
  // void turnRight() {
  //   switch (direction){
  //     case Direction.north:
  //       direction = Direction.east;
  //       break;
  //     case Direction.south:
  //       direction = Direction.west;
  //       break;
  //     case Direction.east:
  //       direction = Direction.south;
  //       break;
  //     case Direction.west:
  //       direction = Direction.north;
  //       break;
  //   }
  // }
  
  //Instuction process
    void processIn (String instructions){
      for (int i = 0; i < instructions.length; i++){
        switch (instructions[i]) {
          case 'R':
            turnRight();
            break;
          case 'L':
            turnLeft();
            break;
          case 'A':
            advance();
            break;
        }
      }
    }
  // Print the final position and direction
  processIn(instructions);
  print("Final position: {$x, $y}");
  print("Facing: $direction ");
}
