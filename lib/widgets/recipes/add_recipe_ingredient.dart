import "package:flutter/material.dart";
import "package:organizer_rodzinny/models/Ingredient.dart";

class AddRecipeIngredient extends StatelessWidget {
  const AddRecipeIngredient({super.key, required this.ingredient});

  final Ingredient ingredient;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: ListTile(
        title: Text(ingredient.name),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (ingredient.amount != null)
              Text(
                ingredient.amount! % 1 == 0
                    ? ingredient.amount!.toInt().toString()
                    : ingredient.amount!.toStringAsFixed(2),
              ),
            const SizedBox(
              width: 5,
            ),
            if (ingredient.unit != null)
              Text(
                ingredient.unit!,
              ),
          ],
        ),
      ),
    );
  }
}
