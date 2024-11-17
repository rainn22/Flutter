import 'package:first_project/W6-S1/EXERCISE-4/joke_model.dart';

List<Joke> jokes = List.generate(
  20,
  (index) => Joke(
    title: 'Joke Title $index',
    description: 'This is the description of joke $index.',
  ),
);