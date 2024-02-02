import "package:uuid/uuid.dart";

const uuid = Uuid();

class ShoppingListItem {
  ShoppingListItem({
    required this.name,
    required this.quantity,
    required this.unit,
    required this.checked,
    this.category,
  }) : id = uuid.v4();

  final String id;
  final String name;
  final double quantity;
  final String unit;
  bool checked;
  final String? category;
}
