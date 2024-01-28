import "package:flutter/material.dart";
import "package:organizer_rodzinny/models/meal.dart";
import "package:organizer_rodzinny/screens/meals/meal_details.dart";

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
  });

  final Meal meal;

  void openMealDetails(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetails(meal: meal),
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
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          openMealDetails(context);
        },
        child: ListTile(
            title: Text(meal.name),
            subtitle: Text(meal.description),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  iconSize: 16,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  iconSize: 16,
                  onPressed: () {},
                ),
              ],
            )),
      ),
    );
  }
}
