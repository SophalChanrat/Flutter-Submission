import 'package:test/W8/EXERCISE-4/model/jokes.dart';

List<Joke> jokes = List.generate(
  20,
  (index) => Joke(
    title: "Title ${index + 1}",
    description: "Description ${index + 1}",
  ),
); 