import "package:flutter/material.dart";
import "package:organizer_rodzinny/models/shopping_list_item.dart";
import "package:organizer_rodzinny/widgets/shopping_list/shopping_list_single_item.dart";

class ListOfShoppingLists extends StatelessWidget {
  const ListOfShoppingLists({
    super.key,
    required this.shoppingList,
    required this.onCheckboxChanged,
    required this.onRemoveItem,
    required this.onEditItem,
  });

  final List<ShoppingListItem> shoppingList;
  final void Function(ShoppingListItem shoppingListItem, bool value)
      onCheckboxChanged;
  final void Function(ShoppingListItem shoppingListItem) onRemoveItem;
  final void Function(ShoppingListItem shoppingListItem) onEditItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        bottom: 8.0,
      ),
      child: ListView.separated(
        itemCount: shoppingList.length,
        itemBuilder: (context, index) => Dismissible(
          onDismissed: (direction) {
            onRemoveItem(shoppingList[index]);
          },
          key: ValueKey(shoppingList[index].id),
          child: ShoppingListSingleItem(
            shoppingListItem: shoppingList[index],
            onCheckboxChanged: onCheckboxChanged,
            onRemoveItem: onRemoveItem,
            onEditItem: onEditItem,
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
      ),
    );
  }
}
