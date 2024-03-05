part of 'shopping_list_cubit.dart';

sealed class ShoppingListCubitState extends Equatable {
  const ShoppingListCubitState();

  @override
  List<Object> get props => [];
}

final class ShoppingListInitial extends ShoppingListCubitState {}

final class ShoppingListUpdatedState extends ShoppingListCubitState {
  final List<ShoppingList> shoppingLists;
  final Map<String, List<ShoppingListItem>> shoppingListItems;
  String currentShoppingListId = "";

  ShoppingListUpdatedState(
      this.shoppingLists, this.shoppingListItems, this.currentShoppingListId);

  @override
  List<Object> get props =>
      [shoppingLists, shoppingListItems, currentShoppingListId];
}
