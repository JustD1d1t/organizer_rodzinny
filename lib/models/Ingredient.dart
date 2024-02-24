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

  ShoppingRecipeIngredient copyWith({
    String? name,
    double? amount,
    String? unit,
    bool? checked,
  }) {
    return ShoppingRecipeIngredient(
      name: name ?? this.name,
      amount: amount ?? this.amount,
      unit: unit ?? this.unit,
      checked: checked ?? this.checked,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'amount': amount,
      'unit': unit,
      'checked': checked,
    };
  }

  factory ShoppingRecipeIngredient.fromMap(Map<String, dynamic> map) {
    return ShoppingRecipeIngredient(
      name: map['name'],
      amount: map['amount'],
      unit: map['unit'],
      checked: map['checked'],
    );
  }
}
