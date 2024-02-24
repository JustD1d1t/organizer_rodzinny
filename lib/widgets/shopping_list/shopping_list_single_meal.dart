import "package:flutter/material.dart";

class ShoppingListSingleMeal extends StatelessWidget {
  const ShoppingListSingleMeal({
    super.key,
    required this.meal,
    required this.onRemoveMeal,
    required this.onEditMeal,
  });

  final String meal;
  final Function(String meal) onRemoveMeal;
  final Function(String meal) onEditMeal;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: InkWell(
        onTap: () {
          onEditMeal(meal);
        },
        child: ListTile(
          title: Text(meal),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              onRemoveMeal(meal);
            },
          ),
        ),
      ),
    );
  }
}