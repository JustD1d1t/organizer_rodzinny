import "package:flutter/material.dart";
import "package:organizer_rodzinny/blocs/bloc_exports.dart";
import "package:organizer_rodzinny/models/shopping_list.dart";
import "package:organizer_rodzinny/models/shopping_list_item.dart";
import "package:organizer_rodzinny/screens/shopping_list/cubit/shopping_list_cubit.dart";
import "package:organizer_rodzinny/screens/shopping_list/shopping_list_screen.dart";

class ShoppingListSingleList extends StatelessWidget {
  const ShoppingListSingleList({super.key, required this.shoppingList});

  final ShoppingList shoppingList;

  void openList(
      BuildContext context, ShoppingList shoppingListSingleItem) async {
    context
        .read<ShoppingListCubit>()
        .setCurrentShoppingListId(id: shoppingList.id);
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const ShoppingListScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    List<ShoppingListItem> sublist = shoppingList.list.length > 4
        ? shoppingList.list.sublist(0, 4)
        : shoppingList.list;
    for (var i = 0; i < sublist.length; i++) {
      widgetList.add(
        Text(
          shoppingList.list[i].name,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          openList(context, shoppingList);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              shoppingList.name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            ...widgetList.toList(),
          ],
        ),
      ),
    );
  }
}
