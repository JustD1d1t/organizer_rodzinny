import "package:equatable/equatable.dart";
import "package:uuid/uuid.dart";

const uuid = Uuid();

class ShoppingListItem extends Equatable {
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

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "category": category,
      "checked": checked,
    };
  }

  factory ShoppingListItem.fromMap(Map<String, dynamic> map) {
    return ShoppingListItem(
      name: map["name"],
      category: map["category"],
      checked: map["checked"],
    );
  }

  @override
  List<Object?> get props => [id, name, category, checked];
}
