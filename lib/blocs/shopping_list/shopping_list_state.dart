part of 'shopping_list_bloc.dart';

class ShoppingListState extends Equatable {
  final List<ShoppingList> shoppingLists;
  final List<ShoppingListItem> shoppingListItems;
  final List<ShoppingRecipeIngredient> shoppingRecipeIngredients;
  const ShoppingListState({
    this.shoppingLists = const <ShoppingList>[],
    this.shoppingListItems = const <ShoppingListItem>[],
    this.shoppingRecipeIngredients = const <ShoppingRecipeIngredient>[],
  });

  @override
  List<Object> get props => [shoppingLists];

  Map<String, dynamic> toMap() {
    return {
      'shoppingLists': shoppingLists.map((e) => e.toMap()).toList(),
      'shoppingListItems': shoppingListItems.map((e) => e.toMap()).toList(),
      'shoppingRecipeIngredients':
          shoppingRecipeIngredients.map((e) => e.toMap()).toList(),
    };
  }

  factory ShoppingListState.fromMap(Map<String, dynamic> map) {
    return ShoppingListState(
      shoppingLists: List<ShoppingList>.from(
        map['shoppingLists']?.map((x) => ShoppingList.fromMap(x)) ?? [],
      ),
      shoppingListItems: List<ShoppingListItem>.from(
        map['shoppingListItems']?.map((x) => ShoppingListItem.fromMap(x)) ?? [],
      ),
      shoppingRecipeIngredients: List<ShoppingRecipeIngredient>.from(
        map['shoppingRecipeIngredients']
                ?.map((x) => ShoppingRecipeIngredient.fromMap(x)) ??
            [],
      ),
    );
  }
}

final class ShoppingListInitial extends ShoppingListState {}
