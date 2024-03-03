import "package:flutter/material.dart";
import "package:organizer_rodzinny/blocs/bloc_exports.dart";
import "package:organizer_rodzinny/models/shopping_list_item.dart";

class ShoppingListSingleItem extends StatefulWidget {
  const ShoppingListSingleItem({
    super.key,
    required this.shoppingListItem,
    required this.shoppingListId,
  });

  final String shoppingListId;
  final ShoppingListItem shoppingListItem;

  @override
  State<ShoppingListSingleItem> createState() => _ShoppingListSingleItemState();
}

class _ShoppingListSingleItemState extends State<ShoppingListSingleItem> {
  void changeSelection(bool) {
    setState(() {
      widget.shoppingListItem.checked = bool;
    });
  }

  void removeItem() {
    context.read<ShoppingListBloc>().add(
          RemoveItemFromShoppingList(
            shoppingListItem: widget.shoppingListItem,
            shoppingListId: widget.shoppingListId,
          ),
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
        title: Text(widget.shoppingListItem.name),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              value: widget.shoppingListItem.checked,
              onChanged: (bool? value) {
                changeSelection(
                  value!,
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: removeItem,
            ),
          ],
        ),
      ),
    );
  }
}
