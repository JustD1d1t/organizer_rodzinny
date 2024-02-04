import "package:uuid/uuid.dart";

const uuid = Uuid();

class Ingredient {
  Ingredient({
    required this.name,
    this.amount = 0,
    this.unit = "",
    // this.checked = false,
  }) : id = uuid.v4();

  final String id;
  final String name;
  final double? amount;
  final String? unit;
  // bool checked;
}

class ShoppingRecipeIngredient extends Ingredient {
  ShoppingRecipeIngredient({
    required String name,
    double? amount,
    String? unit,
    required this.checked,
  }) : super(name: name, amount: amount, unit: unit);

  bool checked;
}
