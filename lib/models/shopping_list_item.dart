import "package:equatable/equatable.dart";
import "package:uuid/uuid.dart";

const uuid = Uuid();

// ignore: must_be_immutable
class ShoppingListItem extends Equatable {
  ShoppingListItem({
    required this.name,
    required this.category,
    required this.checked,
    required this.id,
  }) {
    id = id.isEmpty ? uuid.v4() : id;
  }

  String id;
  final String name;
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
      id: map["id"],
    );
  }

  @override
  List<Object?> get props => [id, name, category, checked];
}
