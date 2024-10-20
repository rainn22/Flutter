enum Color {
  brown('brown'),
  white('white'),
  red('red');

  final String colorName;
  const Color(this.colorName);
  String toString() => colorName;
}

enum RoomType {
  bedroom('Bedroom'),
  livingroom('Living Room'),
  kitchen('Kitchen');

  final String roomType;
  const RoomType(this.roomType);
  String toString() => roomType;
}

// Class Window
class Window {
  Color color;
  String type;

  Window(this.color, this.type);

  @override
  String toString() {
    return '(color: $color, type: $type)';
  }
}

// Class Door
class Door {
  Color color;
  String place;

  Door(this.color, this.place);

  @override
  String toString() {
    return '$place(color: $color)';
  }
}

// Class Room
class Room {
  RoomType roomType;
  Window window;
  Door door;

  Room(this.roomType, this.window, this.door);

  @override
  String toString() {
    return '\n Room Type: $roomType \n Door: $door \n Window: $window';
  }
}

// Class House
class House {
  String address;
  Roof roof;
  List<Window> windows = [];
  List<Door> doors = [];
  List<Room> rooms = [];

  House(this.address, this.roof);

  void addWindow(Window newWin) {
    this.windows.add(newWin);
  }

  void addDoor(Door newDoor) {
    this.doors.add(newDoor);
  }

  void addRoom(Room newRoom) {
    this.rooms.add(newRoom);
  }

  @override
  String toString() {
    return 'House address: $address \n Room: $rooms \n $roof';
  }
}

class Roof {
  Color color;
  Roof(this.color);

  @override
  String toString() {
    return 'Roof color: $color';
  }
}

void main() {
// add roof
  Roof roof = Roof(Color.red);

  House myhouse = House('Kampong Cham', roof);

// add window
  Window window1 = Window(Color.white, 'sliding');
  myhouse.addWindow(window1);

  Window window2 = Window(Color.brown, 'sliding');
  myhouse.addWindow(window2);

  Window window3 = Window(Color.brown, 'sliding');
  myhouse.addWindow(window3);

// add door
  Door door1 = Door(Color.brown, 'frontdoor');
  myhouse.addDoor(door1);
  Door door2 = Door(Color.white, 'backdoor');
  myhouse.addDoor(door2);

//add room
  Room bedroom = Room(RoomType.bedroom, window1, door1);
  myhouse.addRoom(bedroom);
  Room livingroom = Room(RoomType.livingroom, window2, door1);
  myhouse.addRoom(livingroom);
  Room kitchen = Room(RoomType.kitchen, window3, door1);
  myhouse.addRoom(kitchen);

//print my house
  print(myhouse);
}
