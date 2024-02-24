import "package:flutter/material.dart";
import "package:organizer_rodzinny/models/shopping_list_item.dart";

class ShoppingListSingleItem extends StatefulWidget {
  const ShoppingListSingleItem({
    super.key,
    required this.shoppingListItem,
    required this.onRemoveItem,
    required this.onEditItem,
  });

  final ShoppingListItem shoppingListItem;
  final Function(ShoppingListItem shoppingListItem) onRemoveItem;
  final Function(ShoppingListItem shoppingListItem) onEditItem;

  @override
  State<ShoppingListSingleItem> createState() => _ShoppingListSingleItemState();
}

class _ShoppingListSingleItemState extends State<ShoppingListSingleItem> {
  void changeSelection(bool) {
    setState(() {
      widget.shoppingListItem.checked = bool;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: InkWell(
        onTap: () {
          widget.onEditItem(widget.shoppingListItem);
        },
        child: ListTile(
          title: Text(widget.shoppingListItem.name),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // if (shoppingListItem.quantity != null)
              //   Text(
              //     shoppingListItem.quantity! % 1 == 0
              //         ? shoppingListItem.quantity!.toInt().toString()
              //         : shoppingListItem.quantity!.toStringAsFixed(2),
              //   ),
              // const SizedBox(
              //   width: 5,
              // ),
              // if (shoppingListItem.unit != null)
              //   Text(
              //     shoppingListItem.unit!,
              //   ),
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
                onPressed: () {
                  widget.onRemoveItem(widget.shoppingListItem);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
