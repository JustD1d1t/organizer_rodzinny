import "package:uuid/uuid.dart";

const uuid = Uuid();

class Recipe {
  Recipe({
    required this.name,
    this.description = "",
    this.ingredients = const [],
    this.steps = const [],
  }) : id = uuid.v4();

  final String id;
  final String name;
  final String? description;
  final List<dynamic> ingredients;
  final List<dynamic>? steps;
}

class ShoppingRecipeItem extends Recipe {
  ShoppingRecipeItem({
    required String name,
    required List<dynamic> ingredients,
    String? description,
    List<dynamic>? steps,
    required this.checked,
  }) : super(
            name: name,
            description: description,
            ingredients: ingredients,
            steps: steps);
  bool checked;
}
