import "package:flutter/material.dart";
import "package:organizer_rodzinny/models/meal.dart";
import "package:organizer_rodzinny/widgets/meals/meal_item.dart";

class MealsList extends StatefulWidget {
  const MealsList({super.key, required this.meals, required this.onRemoveMeal});

  final List<Meal> meals;
  final Function(Meal) onRemoveMeal;

  @override
  State<MealsList> createState() => _MealsListState();
}

class _MealsListState extends State<MealsList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        bottom: 8.0,
      ),
      child: ListView.separated(
        itemCount: widget.meals.length,
        reverse: true,
        itemBuilder: (context, index) => Dismissible(
          onDismissed: (direction) => widget.onRemoveMeal(widget.meals[index]),
          key: ValueKey(widget.meals[index].id),
          child: MealItem(meal: widget.meals[index]),
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: 10,
        ),
      ),
    );
  }
}
