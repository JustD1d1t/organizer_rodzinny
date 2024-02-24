import "package:flutter/material.dart";
import "package:organizer_rodzinny/models/Ingredient.dart";

class ShoppingListSingleRecipeIngredient extends StatefulWidget {
  const ShoppingListSingleRecipeIngredient({
    super.key,
    required this.ingredient,
    required this.onRemoveItem,
  });

  final ShoppingRecipeIngredient ingredient;
  final Function(ShoppingRecipeIngredient ingredient) onRemoveItem;

  @override
  State<ShoppingListSingleRecipeIngredient> createState() =>
      _ShoppingListSingleRecipeIngredientState();
}

class _ShoppingListSingleRecipeIngredientState
    extends State<ShoppingListSingleRecipeIngredient> {
  void changeSelection(bool) {
    setState(() {
      widget.ingredient.checked = bool;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: ListTile(
        title: Text(widget.ingredient.name),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.ingredient.amount != null)
              Text(
                widget.ingredient.amount! % 1 == 0
                    ? widget.ingredient.amount!.toInt().toString()
                    : widget.ingredient.amount!.toStringAsFixed(2),
              ),
            const SizedBox(
              width: 5,
            ),
            if (widget.ingredient.unit != null)
              Text(
                widget.ingredient.unit!,
              ),
            Checkbox(
              value: widget.ingredient.checked,
              onChanged: (bool? value) {
                changeSelection(value);
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                widget.onRemoveItem(widget.ingredient);
              },
            ),
          ],
        ),
      ),
    );
  }
}
