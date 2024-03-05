import "package:flutter/material.dart";
import "package:organizer_rodzinny/blocs/bloc_exports.dart";
import "package:organizer_rodzinny/models/shopping_list_item.dart";
import "package:organizer_rodzinny/widgets/shopping_list/shopping_list_single_item.dart";

class ListOfShoppingItems extends StatelessWidget {
  const ListOfShoppingItems({
    super.key,
    this.shoppingListId,
    required this.shoppingList,
    // required this.recipesList,
  });

  final String? shoppingListId;
  final List<ShoppingListItem> shoppingList;
  // final List<ShoppingRecipeItem> recipesList;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListBloc, ShoppingListState>(
      builder: (context, state) {
        // TODO: listen to state.shoppingListItems, not state.shoppingLists
        List<ShoppingListItem> shoppingList = state.shoppingLists
            .where((shoppingList) => shoppingList.id == shoppingListId)
            .single
            .list;
        // List<ShoppingRecipeItem> recipesList = state.shoppingLists
        //     .where((shoppingList) => shoppingList.id == widget.shoppingListId)
        //     .single
        //     .recipesList;
        final List<dynamic> allShoppingItems = [
          ...shoppingList,
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
                      return ShoppingListSingleItem(
                        shoppingListItem: allShoppingItems[index],
                        shoppingListId: shoppingListId!,
                      );
                    } else {
                      // return ShoppingListSingleRecipe(
                      //   recipe: allShoppingItems[index],
                      //   shoppingListId: widget.shoppingListId!,
                      // );
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
