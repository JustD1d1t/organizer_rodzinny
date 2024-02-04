import "package:organizer_rodzinny/models/recipe.dart";
import "package:organizer_rodzinny/models/shopping_list_item.dart";
import "package:uuid/uuid.dart";

const uuid = Uuid();

class ShoppingList {
  ShoppingList({
    required this.name,
    required this.list,
    this.recipesList = const [],
  }) : id = uuid.v4();

  final String name;
  final List<ShoppingListItem> list;
  final List<ShoppingRecipeItem> recipesList;
  final String id;
}
