import "package:flutter/material.dart";
import "package:organizer_rodzinny/blocs/bloc_exports.dart";
import "package:organizer_rodzinny/models/shopping_list_item.dart";
import "package:organizer_rodzinny/screens/shopping_list/cubit/shopping_list_cubit.dart";

class ShoppingListSingleItem extends StatelessWidget {
  const ShoppingListSingleItem({
    super.key,
    required this.shoppingListItem,
    required this.shoppingListId,
  });

  final String shoppingListId;
  final ShoppingListItem shoppingListItem;

  void changeSelection(bool value) {}

  void removeItem(BuildContext context) {
    context.read<ShoppingListCubit>().removeItemFromShoppingList(
          shoppingListItem.name,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: ListTile(
        title: Text(shoppingListItem.name),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              value: shoppingListItem.checked,
              onChanged: (bool? value) {
                changeSelection(
                  value!,
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                removeItem(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
