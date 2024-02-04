import "package:flutter/material.dart";
import "package:organizer_rodzinny/models/recipe.dart";
import "package:organizer_rodzinny/models/shopping_list.dart";
import "package:organizer_rodzinny/screens/shopping_list/add_shopping_item_screen.dart";
import 'package:organizer_rodzinny/widgets/shopping_list/list_of_shopping_items.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen(
      {super.key,
      required this.shoppingList,
      required this.onEditName,
      required this.onRemoveList});

  final ShoppingList shoppingList;
  final Function onEditName;
  final Function onRemoveList;

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  void openAddShoppingItemScreen(BuildContext context) async {
    final shoppingListItem = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>
            const AddShopingItemScreen(appBarTitle: "Dodaj element"),
      ),
    );

    if (shoppingListItem != null) {
      setState(() {
        widget.shoppingList.list.add(shoppingListItem);
      });
    }
  }

  void removeList() {
    Navigator.of(context).pop();
    widget.onRemoveList(widget.shoppingList);
  }

  void removeRecipe(ShoppingRecipeItem recipe) {
    final itemIndex = widget.shoppingList.recipesList.indexOf(recipe);
    setState(() {
      widget.shoppingList.recipesList.remove(recipe);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${recipe.name} usunięte'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Cofnij',
          onPressed: () {
            setState(() {
              widget.shoppingList.recipesList.insert(
                itemIndex,
                recipe,
              );
            });
          },
        ),
      ),
    );
  }

  void changeMealItemSelection(ShoppingRecipeItem recipe, bool newValue) {
    setState(() {
      recipe.checked = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.shoppingList.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: removeList,
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              widget.onEditName(widget.shoppingList);
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              openAddShoppingItemScreen(context);
            },
          ),
        ],
      ),
      body: ListOfShoppingItems(
        shoppingList: widget.shoppingList.list,
        recipesList: widget.shoppingList.recipesList,
      ),
    );
  }
}
