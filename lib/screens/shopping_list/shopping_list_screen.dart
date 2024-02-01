import "package:flutter/material.dart";
import "package:organizer_rodzinny/models/shopping_list.dart";
import "package:organizer_rodzinny/models/shopping_list_item.dart";
import "package:organizer_rodzinny/screens/shopping_list/add_shopping_item_screen.dart";
import 'package:organizer_rodzinny/widgets/shopping_list/list_of_shopping_lists.dart';

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

  void changeItemSelection(ShoppingListItem shoppingListItem, bool newValue) {
    setState(() {
      shoppingListItem.checked = newValue;
    });
  }

  void removeItem(ShoppingListItem shoppingListItem) {
    final itemIndex = widget.shoppingList.list.indexOf(shoppingListItem);
    setState(() {
      widget.shoppingList.list.remove(shoppingListItem);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${shoppingListItem.name} usunięte'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Cofnij',
          onPressed: () {
            setState(() {
              widget.shoppingList.list.insert(
                itemIndex,
                shoppingListItem,
              );
            });
          },
        ),
      ),
    );
  }

  void editItem(ShoppingListItem shoppingListItem) async {
    final id = shoppingListItem.id;
    final index =
        widget.shoppingList.list.indexWhere((element) => element.id == id);
    final editingShoppingListItem = widget.shoppingList.list[index];
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
      widget.shoppingList.list[index] = editedShoppingListItem;
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
              openAddShoppingItemScreen(context);
            },
          ),
        ],
      ),
      body: ListOfShoppingLists(
        shoppingList: widget.shoppingList.list,
        onCheckboxChanged: changeItemSelection,
        onRemoveItem: removeItem,
        onEditItem: editItem,
      ),
    );
  }
}
