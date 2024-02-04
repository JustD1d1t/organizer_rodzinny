import "package:uuid/uuid.dart";

const uuid = Uuid();

class ShoppingListItem {
  ShoppingListItem({
    required this.name,
    required this.category,
    // required this.quantity,
    // required this.unit,
    required this.checked,
  }) : id = uuid.v4();

  final String id;
  final String name;
  // final double? quantity;
  // final String? unit;
  final String? category;
  bool checked;
}
