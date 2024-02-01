import "package:flutter/material.dart";
import "package:organizer_rodzinny/data/dummy_data.dart";
import "package:organizer_rodzinny/models/shopping_list.dart";
import "package:organizer_rodzinny/screens/shopping_list/shopping_list_screen.dart";
import "package:organizer_rodzinny/widgets/shopping_list/add_shopping_list.dart";
import "package:organizer_rodzinny/widgets/shopping_list/edit_shopping_list_name.dart";
import "package:organizer_rodzinny/widgets/shopping_list/shopping_list_single_list.dart";

class ListOfShoppingListsScreen extends StatefulWidget {
  const ListOfShoppingListsScreen({super.key});

  @override
  State<ListOfShoppingListsScreen> createState() =>
      _ListOfShoppingListsScreenState();
}

class _ListOfShoppingListsScreenState extends State<ListOfShoppingListsScreen> {
  final List<ShoppingList> shoppingList = exampleShoppingLists;

  void openList(ShoppingList shoppingListSingleItem) async {
    final id = shoppingListSingleItem.id;
    final index = shoppingList.indexWhere((element) => element.id == id);
    final editingShoppingListItem = shoppingList[index];
    final ShoppingList editedShoppingList = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => ShoppingListScreen(
          shoppingList: editingShoppingListItem,
          onEditName: changeListName,
          onRemoveList: removeList,
        ),
      ),
    );
    setState(() {
      shoppingList[index] = editedShoppingList;
    });
  }

  void addList() async {
    final list = await showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => const AddShoppingList(),
    );
    if (list != null) {
      setState(() {
        shoppingList.add(list);
      });
    }
  }

  void removeList(ShoppingList list) {
    final listIndex = shoppingList.indexOf(list);
    setState(() {
      shoppingList.remove(list);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${list.name} usunięta'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              shoppingList.insert(
                listIndex,
                list,
              );
            });
          },
        ),
      ),
    );
  }

  void changeListName(ShoppingList list) async {
    final updatedList = await showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => EditShoppingListName(listToEdit: list),
    );
    final listIndex = shoppingList.indexOf(list);
    if (updatedList != null) {
      setState(() {
        shoppingList[listIndex] = updatedList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final shoppingLists = exampleShoppingLists;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listy zakupów"),
        actions: [
          IconButton(
            onPressed: addList,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
          right: 8.0,
          bottom: 8.0,
        ),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            for (var shoppingList in shoppingLists)
              ShoppingListSingleList(list: shoppingList, onTap: openList),
          ],
        ),
      ),
    );
  }
}
