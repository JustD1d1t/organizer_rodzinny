import "package:organizer_rodzinny/models/shopping_list_item.dart";
import "package:uuid/uuid.dart";

const uuid = Uuid();

class ShoppingList {
  ShoppingList({
    required this.name,
    required this.list,
  }) : id = uuid.v4();

  final String name;
  final List<ShoppingListItem> list;
  final String id;
}
