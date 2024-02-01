import "package:flutter/material.dart";
import "package:organizer_rodzinny/models/shopping_list.dart";

class ShoppingListSingleList extends StatelessWidget {
  const ShoppingListSingleList(
      {super.key, required this.list, required this.onTap});

  final ShoppingList list;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.white,
        
      ),
      child: InkWell(
        onTap: () {
          onTap(list);
        },
        child: ListTile(
          title: Text(list.name),
        ),
      ),
    );
  }
}
