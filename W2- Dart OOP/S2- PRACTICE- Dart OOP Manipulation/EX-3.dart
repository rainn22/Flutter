class MyDuration {
  final int _milliseconds;

  // Constructor
  // Constructs a duration from a number of hours
  MyDuration.fromHours(int hours): _milliseconds = hours >= 0 ? hours * 60 * 60 * 1000 : 0;
  MyDuration.fromMinutes(int minutes):  _milliseconds = minutes >= 0 ? minutes * 60 * 1000 : 0;
  MyDuration.fromSeconds(int seconds): _milliseconds = seconds >= 0 ? seconds * 1000 : 0;

  //getter in milliseconds
  int get milliseconds => milliseconds;

  //overlaoding
  MyDuration operator +(MyDuration other) {
    return MyDuration._fromMilliseconds(_milliseconds + other._milliseconds);
  }

    MyDuration operator -(MyDuration other) {
    int result = _milliseconds - other._milliseconds;
    if (result < 0) {
      throw Exception("Resulting duration cannot be negative");
    }
    return MyDuration._fromMilliseconds(result);
  }

  // Overload the > operator to compare two MyDuration objects
  bool operator >(MyDuration other) {
    return _milliseconds > other._milliseconds;
  }

  // Private constructor for internal use
  MyDuration._fromMilliseconds(this._milliseconds);

  // Display the duration in a readable format
  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(3); // 3 hours
  MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes
  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1>duration2); //true

  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e); 
  }
}
