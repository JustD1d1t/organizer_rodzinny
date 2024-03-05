import "package:flutter/material.dart";
import "package:organizer_rodzinny/blocs/bloc_exports.dart";
import "package:organizer_rodzinny/models/shopping_list_item.dart";
import "package:organizer_rodzinny/screens/shopping_list/cubit/shopping_list_cubit.dart";

class AddItemTile extends StatelessWidget {
  const AddItemTile({
    super.key,
    required this.item,
    required this.isActive,
    required this.onSelectTile,
  });

  final dynamic item;
  final void Function() onSelectTile;
  final bool isActive;

  void _handleShoppingItem(BuildContext context) {
    if (!isActive) {
      context.read<ShoppingListCubit>().addItemToShoppingList(
            ShoppingListItem(
              name: item['name'],
              checked: false,
              category: item['category'],
              id: "",
            ),
            context.read<AppStateBloc>().state.currentShoppingListId,
          );

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Dodano ${item['name']} do listy zakupów'),
        ),
      );
    } else {
      context.read<ShoppingListCubit>().removeItemFromShoppingList(
            item['name'],
            context.read<AppStateBloc>().state.currentShoppingListId,
          );

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Usunięto ${item['name']} z listy zakupów'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _handleShoppingItem(context);
      },
      splashColor: Theme.of(context).colorScheme.onPrimaryContainer,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isActive
              ? Theme.of(context).colorScheme.tertiaryContainer
              : Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              item['name'],
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: isActive
                        ? Theme.of(context).colorScheme.onTertiaryContainer
                        : Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
              textAlign: TextAlign.center,
            ),
            // const SizedBox(height: 10),
            // icon,
          ],
        ),
      ),
    );
  }
}
