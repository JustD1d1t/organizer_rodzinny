import "package:flutter/material.dart";

class SelectAddItemBottomSheet extends StatefulWidget {
  const SelectAddItemBottomSheet({super.key});

  @override
  State<SelectAddItemBottomSheet> createState() =>
      _SelectAddItemBottomSheetState();
}

class _SelectAddItemBottomSheetState extends State<SelectAddItemBottomSheet> {
  setAddedItemType(type) {
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
              setAddedItemType('item');
            },
            child: const Text("Produkt"),
          ),
          TextButton(
            onPressed: () {
              setAddedItemType('recipe');
            },
            child: const Text("Posiłek"),
          )
        ],
      ),
    );
  }
}
