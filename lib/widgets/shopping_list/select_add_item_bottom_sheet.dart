import "package:flutter/material.dart";

class SelectAddItemBottomSheet extends StatelessWidget {
  SelectAddItemBottomSheet({super.key});

  setAddedItemType(BuildContext context, type) {
    Navigator.of(context).pop(
      {
        "type": type,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              setAddedItemType(context, 'item');
            },
            child: const Text("Produkt"),
          ),
          TextButton(
            onPressed: () {
              setAddedItemType(context, 'recipe');
            },
            child: const Text("Posiłek"),
          )
        ],
      ),
    );
  }
}
