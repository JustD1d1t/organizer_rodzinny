import "package:flutter/material.dart";
import "package:organizer_rodzinny/blocs/bloc_exports.dart";
import "package:organizer_rodzinny/models/recipe.dart";
import "package:organizer_rodzinny/models/shopping_list.dart";
import "package:organizer_rodzinny/screens/shopping_list/add_shopping_item_screen.dart";
import "package:organizer_rodzinny/screens/shopping_list/add_shopping_recipe_screen.dart";
import 'package:organizer_rodzinny/widgets/shopping_list/list_of_shopping_items.dart';
import 'package:organizer_rodzinny/widgets/shopping_list/select_add_item_bottom_sheet.dart';

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
  late final ShoppingList shoppingList;

  @override
  void initState() {
    final id = context.read<AppStateBloc>().state.currentShoppingListId;
    shoppingList =
        context.read<ShoppingListBloc>().state.shoppingLists.firstWhere(
              (element) => element.id == id,
            );
    super.initState();
  }

  void openAddShoppingItemScreen() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => AddShopingItemScreen(
          appBarTitle: "Dodaj element",
          shoppingList: widget.shoppingList,
        ),
      ),
    );
    context.read<ShoppingListBloc>().state.shoppingLists.firstWhere(
          (element) => element.id == widget.shoppingList.id,
        );
    setState(() {
      final id = context.read<AppStateBloc>().state.currentShoppingListId;
      shoppingList =
          context.read<ShoppingListBloc>().state.shoppingLists.firstWhere(
                (element) => element.id == id,
              );
    });
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

  void openAddRecipeScreen() async {
    final recipe = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => AddShoppingRecipeScreen(
          addRecipe: addRecipeToShoppingList,
          shoppingList: widget.shoppingList,
        ),
      ),
    );

    if (recipe != null) {
      setState(() {
        widget.shoppingList.recipesList.add(recipe);
      });
    }
  }

  void selectAddButton() async {
    final selectedItem = await showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => const SelectAddItemBottomSheet(),
    );
    if (selectedItem != null) {
      if (selectedItem["type"] == "item") {
        openAddShoppingItemScreen();
      } else {
        openAddRecipeScreen();
      }
    }
  }

  void changeMealItemSelection(ShoppingRecipeItem recipe, bool newValue) {
    setState(() {
      recipe.checked = newValue;
    });
  }

  addRecipeToShoppingList(Recipe recipe) {
    setState(() {
      widget.shoppingList.recipesList.add(
        ShoppingRecipeItem(
          name: recipe.name,
          checked: false,
          ingredients: recipe.ingredients,
        ),
      );
    });
  }

  void removeList() {
    Navigator.of(context).pop();
    widget.onRemoveList(widget.shoppingList);
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
              selectAddButton();
            },
          ),
        ],
      ),
      body: ListOfShoppingItems(
        shoppingListId: widget.shoppingList.id,
        shoppingList: widget.shoppingList.list,
        recipesList: widget.shoppingList.recipesList,
      ),
    );
  }
}
