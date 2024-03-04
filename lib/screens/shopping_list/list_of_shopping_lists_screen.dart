import "package:flutter/material.dart";
import "package:organizer_rodzinny/blocs/bloc_exports.dart";
import "package:organizer_rodzinny/models/shopping_list.dart";
import "package:organizer_rodzinny/widgets/shopping_list/add_shopping_list.dart";
import 'package:organizer_rodzinny/widgets/shopping_list/shopping_list_single_list.dart';

class ListOfShoppingListsScreen extends StatefulWidget {
  const ListOfShoppingListsScreen({super.key});

  static const id = "list_of_shopping_lists_screen";

  @override
  State<ListOfShoppingListsScreen> createState() =>
      _ListOfShoppingListsScreenState();
}

class _ListOfShoppingListsScreenState extends State<ListOfShoppingListsScreen> {
  @override
  void initState() {
    context.read<ShoppingListBloc>().add(const LoadShoppingListsEvent());
    super.initState();
  }

  void addList() async {
    final list = await showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => const AddShoppingList(),
    );
    // ignore: use_build_context_synchronously
    context
        .read<ShoppingListBloc>()
        .add(AddShoppingListEvent(shoppingList: list));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListBloc, ShoppingListState>(
      builder: (context, state) {
        List<ShoppingList> shoppingLists = state.shoppingLists;
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
                  ShoppingListSingleList(
                    shoppingList: shoppingList,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
