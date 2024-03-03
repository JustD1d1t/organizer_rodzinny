import "package:flutter/material.dart";
import "package:organizer_rodzinny/blocs/bloc_exports.dart";
import "package:organizer_rodzinny/models/shopping_list.dart";
import "package:organizer_rodzinny/screens/shopping_list/add_shopping_item_screen.dart";
import "package:organizer_rodzinny/widgets/shopping_list/edit_shopping_list_name.dart";
import 'package:organizer_rodzinny/widgets/shopping_list/list_of_shopping_items.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  // void openAddRecipeScreen() async {
  //   await Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (ctx) => const AddShoppingRecipeScreen(),
  //     ),
  //   );
  // }

  void openAddShoppingItemScreen() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const AddShoppingItemScreen(),
      ),
    );
  }

  void openEditName() async {
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

  void removeShoppingList() {
    Navigator.of(context).pop();
    context.read<ShoppingListBloc>().add(
          RemoveShoppingList(
            id: context.read<AppStateBloc>().state.currentShoppingListId,
          ),
        );
  }

  // void selectAddButton() async {
  //   final selectedItem = await showModalBottomSheet(
  //     useSafeArea: true,
  //     isScrollControlled: true,
  //     context: context,
  //     builder: (context) => const SelectAddItemBottomSheet(),
  //   );
  //   if (selectedItem != null) {
  //     if (selectedItem["type"] == "item") {
  //       openAddShoppingItemScreen();
  //     } else {
  //       openAddRecipeScreen();
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListBloc, ShoppingListState>(
      builder: (context, state) {
        final id = context.read<AppStateBloc>().state.currentShoppingListId;
        ShoppingList shoppingList = state.shoppingLists.firstWhere(
          (element) => element.id == id,
        );
        return Scaffold(
          appBar: AppBar(
            title: Text(shoppingList.name),
            actions: [
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: removeShoppingList,
              ),
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: openEditName,
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: openAddShoppingItemScreen,
              ),
            ],
          ),
          body: ListOfShoppingItems(
            shoppingListId: shoppingList.id,
            shoppingList: shoppingList.list,
            // recipesList: shoppingList.recipesList,
          ),
        );
      },
    );
  }
}
