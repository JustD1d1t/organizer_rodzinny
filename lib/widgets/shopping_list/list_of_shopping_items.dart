import "package:flutter/material.dart";
import "package:organizer_rodzinny/blocs/bloc_exports.dart";
import "package:organizer_rodzinny/models/Ingredient.dart";
import "package:organizer_rodzinny/models/recipe.dart";
import "package:organizer_rodzinny/models/shopping_list_item.dart";
import "package:organizer_rodzinny/widgets/shopping_list/shopping_list_single_item.dart";
import "package:organizer_rodzinny/widgets/shopping_list/shopping_list_single_recipe.dart";

class ListOfShoppingItems extends StatefulWidget {
  const ListOfShoppingItems({
    super.key,
    this.shoppingListId,
    required this.shoppingList,
    required this.recipesList,
  });

  final String? shoppingListId;
  final List<ShoppingListItem> shoppingList;
  final List<ShoppingRecipeItem> recipesList;

  @override
  State<ListOfShoppingItems> createState() => _ListOfShoppingItemsState();
}

class _ListOfShoppingItemsState extends State<ListOfShoppingItems> {
  List<ShoppingListItem> shoppingList = [];
  List<ShoppingRecipeItem> recipesList = [];
  @override
  void initState() {
    context.read<ShoppingListBloc>().add(
          GetShoppingListItems(
            shoppingListId: widget.shoppingListId.toString(),
          ),
        );
    super.initState();
  }

  void removeRecipe(ShoppingRecipeItem recipe) {
    // setState(() {
    //   recipesList.remove(recipe);
    // });
  }

  void removeItem(ShoppingListItem shoppingListItem) {
    // final itemIndex = shoppingList.indexOf(shoppingListItem);
    // setState(() {
    //   shoppingList.remove(shoppingListItem);
    // });
    // ScaffoldMessenger.of(context).clearSnackBars();
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text('${shoppingListItem.name} usunięte'),
    //     duration: const Duration(seconds: 3),
    //     action: SnackBarAction(
    //       label: 'Cofnij',
    //       onPressed: () {
    //         setState(() {
    //           shoppingList.insert(
    //             itemIndex,
    //             shoppingListItem,
    //           );
    //         });
    //       },
    //     ),
    //   ),
    // );
  }

  void editItem(ShoppingListItem shoppingListItem) async {
    // final id = shoppingListItem.id;
    // final index = widget.shoppingList.indexWhere((element) => element.id == id);
    // final editingShoppingListItem = widget.shoppingList[index];
    // final ShoppingListItem editedShoppingListItem =
    //     await Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (ctx) => AddShopingItemScreen(
    //       shoppingListItem: editingShoppingListItem,
    //       appBarTitle: "Edytuj element",
    //     ),
    //   ),
    // );
    // setState(() {
    //   widget.shoppingList[index] = editedShoppingListItem;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListBloc, ShoppingListState>(
      builder: (context, state) {
        // TODO: listen to state.shoppingListItems, not state.shoppingLists
        List<ShoppingListItem> shoppingList = state.shoppingLists
            .where((shoppingList) => shoppingList.id == widget.shoppingListId)
            .single
            .list;
        List<ShoppingRecipeIngredient> recipesList =
            state.shoppingRecipeIngredients;
        final List<dynamic> allShoppingItems = [
          ...shoppingList,
          ...recipesList
        ];
        return Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 8.0,
            bottom: 8.0,
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: allShoppingItems.length,
                  itemBuilder: (context, index) {
                    if (allShoppingItems[index] is ShoppingListItem) {
                      return Dismissible(
                        onDismissed: (direction) {
                          removeItem(allShoppingItems[index]);
                        },
                        key: ValueKey(allShoppingItems[index].id),
                        child: ShoppingListSingleItem(
                          shoppingListItem: allShoppingItems[index],
                          onRemoveItem: removeItem,
                          onEditItem: editItem,
                        ),
                      );
                    } else {
                      return Dismissible(
                        onDismissed: (direction) {
                          removeRecipe(allShoppingItems[index]);
                        },
                        key: ValueKey(allShoppingItems[index].id),
                        child: ShoppingListSingleRecipe(
                          recipe: allShoppingItems[index],
                          onRemoveItem: removeRecipe,
                        ),
                      );
                    }
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
