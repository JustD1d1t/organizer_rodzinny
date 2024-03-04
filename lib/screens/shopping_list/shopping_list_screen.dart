import "package:flutter/material.dart";
import "package:organizer_rodzinny/blocs/bloc_exports.dart";
import "package:organizer_rodzinny/models/shopping_list.dart";
import "package:organizer_rodzinny/models/shopping_list_item.dart";
import "package:organizer_rodzinny/screens/shopping_list/add_shopping_item_screen.dart";
import "package:organizer_rodzinny/widgets/shopping_list/edit_shopping_list_name.dart";
import 'package:organizer_rodzinny/widgets/shopping_list/list_of_shopping_items.dart';

class ShoppingListScreen extends StatelessWidget {
  const ShoppingListScreen({super.key});

  // void openAddRecipeScreen() async {
  void openAddShoppingItemScreen(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => AddShoppingItemScreen(),
      ),
    );
  }

  void openEditName(BuildContext context) async {
    final shoppingListId =
        context.read<AppStateBloc>().state.currentShoppingListId;
    final shoppingList =
        context.read<ShoppingListBloc>().state.shoppingLists.firstWhere(
              (element) => element.id == shoppingListId,
            );

    await showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => EditShoppingListName(listToEdit: shoppingList),
    );
  }

  void removeShoppingList(BuildContext context) {
    Navigator.of(context).pop();
    context.read<ShoppingListBloc>().add(
          RemoveShoppingList(
            id: context.read<AppStateBloc>().state.currentShoppingListId,
          ),
        );
  }

  // void selectAddButton() async {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListBloc, ShoppingListState>(
      builder: (context, state) {
        final id = context.read<AppStateBloc>().state.currentShoppingListId;
        List<ShoppingListItem> shoppingListItems = state.shoppingListItems[id]!;
        ShoppingList shoppingList = state.shoppingLists.firstWhere(
          (element) => element.id == id,
        );
        return Scaffold(
          appBar: AppBar(
            title: Text(shoppingList.name),
            actions: [
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  removeShoppingList(context);
                },
              ),
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  openEditName(context);
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
            shoppingListId: shoppingList.id,
            shoppingList: shoppingListItems,
            // recipesList: shoppingList.recipesList,
          ),
        );
      },
    );
  }
}
