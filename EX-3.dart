void main() {
  
  // List of student scores
  List<int> scores = [45, 67, 82, 49, 51, 78, 92, 30];
  var passed = scores.where((s)=> s >= 50);

  // You code
  print(passed.toList());
  print('${passed.length} students passed');
 
}