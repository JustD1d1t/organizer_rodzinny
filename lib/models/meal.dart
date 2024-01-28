import "package:uuid/uuid.dart";

const uuid = Uuid();

class Meal {
  Meal({
    required this.name,
    required this.description,
    required this.ingredients,
    required this.steps,
  }) : id = uuid.v4();

  final String id;
  final String name;
  final String description;
  final List<dynamic> ingredients;
  final List<dynamic> steps;
}