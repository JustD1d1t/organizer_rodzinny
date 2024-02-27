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

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'ingredients': ingredients,
      'steps': steps,
      'checked': checked,
    };
  }

  factory ShoppingRecipeItem.fromMap(Map<String, dynamic> map) {
    return ShoppingRecipeItem(
      name: map['name'],
      description: map['description'],
      ingredients: List<dynamic>.from(map['ingredients']),
      steps: List<dynamic>.from(map['steps']),
      checked: map['checked'],
    );
  }
}
