import "package:flutter/material.dart";
import "package:organizer_rodzinny/blocs/bloc_exports.dart";
import "package:organizer_rodzinny/models/shopping_list.dart";
import "package:organizer_rodzinny/models/shopping_list_item.dart";
import "package:organizer_rodzinny/screens/shopping_list/add_shopping_item_screen.dart";
import "package:organizer_rodzinny/screens/shopping_list/cubit/shopping_list_cubit.dart";
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
        context.read<ShoppingListCubit>().currentShoppingListId;
    final shoppingList =
        context.read<ShoppingListCubit>().shoppingLists.firstWhere(
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
    context.read<ShoppingListCubit>().removeShoppingList();
  }

  // void selectAddButton() async {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListCubit, ShoppingListCubitState>(
      builder: (context, state) {
        final id = context.read<ShoppingListCubit>().currentShoppingListId;
        List<ShoppingListItem> shoppingListItems =
            context.read<ShoppingListCubit>().shoppingListItems[id]!;
        ShoppingList shoppingList =
            context.read<ShoppingListCubit>().shoppingLists.firstWhere(
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
