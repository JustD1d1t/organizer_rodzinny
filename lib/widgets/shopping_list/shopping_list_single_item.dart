import "package:flutter/material.dart";
import "package:organizer_rodzinny/models/shopping_list_item.dart";

class ShoppingListSingleItem extends StatelessWidget {
  const ShoppingListSingleItem({
    super.key,
    required this.shoppingListItem,
    required this.onCheckboxChanged,
    required this.onRemoveItem,
    required this.onEditItem,
  });

  final ShoppingListItem shoppingListItem;
  final Function(ShoppingListItem shoppingListItem, bool value)
      onCheckboxChanged;
  final Function(ShoppingListItem shoppingListItem) onRemoveItem;
  final Function(ShoppingListItem shoppingListItem) onEditItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: InkWell(
        onTap: () {
          onEditItem(shoppingListItem);
        },
        child: ListTile(
          title: Text(shoppingListItem.name),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                shoppingListItem.quantity % 1 == 0
                    ? shoppingListItem.quantity.toInt().toString()
                    : shoppingListItem.quantity.toStringAsFixed(2),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                shoppingListItem.unit,
              ),
              Checkbox(
                value: shoppingListItem.checked,
                onChanged: (bool? value) {
                  onCheckboxChanged(
                    shoppingListItem,
                    value!,
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  onRemoveItem(shoppingListItem);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
