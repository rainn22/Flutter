// Class Window
class Window {
  String color;
  String type;
  String place;

  Window(this.color, this.type, this.place);

  @override
  String toString() {
    return 'Window type : $type, Window color: $color, Window place : $place';
  }
}

// Class Room
class Room {
  String type;

  Room(this.type);

  @override
  String toString() {
    return 'Room type : $type';
  }
}

// Class House
class House {
  String address;
  List<Window> windows = [];
  List<Room> rooms = [];

  House(this.address);

  void addWindow(Window newWin) {
    this.windows.add(newWin);
  }

  void addRoom(Room newRoom) {
    this.rooms.add(newRoom);
  }

  @override
  String toString() {
    return 'House address: $address \n $rooms \n $windows';
  }
}

void main() {
  House myhouse = House('Kampong Cham');

  Room bedroom = Room('bedroom');
  myhouse.addRoom(bedroom);

  Window window1 = Window('white', 'sliding', 'upstair');
  myhouse.addWindow(window1);

  print(myhouse);
}
