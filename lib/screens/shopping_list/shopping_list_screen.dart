import "package:flutter/material.dart";
import "package:organizer_rodzinny/data/dummy_data.dart";
import "package:organizer_rodzinny/models/shopping_list_item.dart";
import "package:organizer_rodzinny/screens/shopping_list/add_shopping_item_screen.dart";
import "package:organizer_rodzinny/widgets/shopping_list/shopping_list_list.dart";

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  final List<ShoppingListItem> shoppingListItems = exampleShoppingList;

  void openAddShoppingItemScreen(BuildContext context) async {
    final shoppingListItem = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>
            const AddShopingItemScreen(appBarTitle: "Dodaj element"),
      ),
    );

    if (shoppingListItem != null) {
      setState(() {
        shoppingListItems.add(shoppingListItem);
      });
    }
  }

  void changeItemSelection(ShoppingListItem shoppingListItem, bool newValue) {
    setState(() {
      shoppingListItem.checked = newValue;
    });
  }

  void removeItem(ShoppingListItem shoppingListItem) {
    setState(() {
      shoppingListItems.remove(shoppingListItem);
    });
  }

  void editItem(ShoppingListItem shoppingListItem) async {
    final id = shoppingListItem.id;
    final index = shoppingListItems.indexWhere((element) => element.id == id);
    final editingShoppingListItem = shoppingListItems[index];
    final ShoppingListItem editedShoppingListItem =
        await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => AddShopingItemScreen(
          shoppingListItem: editingShoppingListItem,
          appBarTitle: "Edytuj element",
        ),
      ),
    );
    setState(() {
      shoppingListItems[index] = editedShoppingListItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista zakupowa"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              openAddShoppingItemScreen(context);
            },
          ),
        ],
      ),
      body: ShoppingListList(
        shoppingList: exampleShoppingList,
        onCheckboxChanged: changeItemSelection,
        onRemoveItem: removeItem,
        onEditItem: editItem,
      ),
    );
  }
}
