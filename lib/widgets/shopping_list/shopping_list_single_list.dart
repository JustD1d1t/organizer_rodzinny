import "package:flutter/material.dart";
import "package:organizer_rodzinny/models/shopping_list.dart";
import "package:organizer_rodzinny/models/shopping_list_item.dart";

class ShoppingListSingleList extends StatelessWidget {
  const ShoppingListSingleList(
      {super.key, required this.shoppingList, required this.onSingleListClick});

  final ShoppingList shoppingList;
  final Function onSingleListClick;

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
          onSingleListClick(shoppingList);
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
