part of 'shopping_list_bloc.dart';

abstract class ShoppingListEvent extends Equatable {
  const ShoppingListEvent();

  @override
  List<Object> get props => [];
}

class LoadShoppingListsEvent extends ShoppingListEvent {
  const LoadShoppingListsEvent();
}

class AddShoppingListEvent extends ShoppingListEvent {
  final ShoppingList shoppingList;

  const AddShoppingListEvent({required this.shoppingList});

  @override
  List<Object> get props => [shoppingList];
}

class AddItemToShoppingList extends ShoppingListEvent {
  final ShoppingListItem shoppingListItem;
  final String shoppingListId;

  const AddItemToShoppingList(
      {required this.shoppingListItem, required this.shoppingListId});

  @override
  List<Object> get props => [shoppingListItem, shoppingListId];
}

class RemoveItemFromShoppingList extends ShoppingListEvent {
  final ShoppingListItem shoppingListItem;
  final String shoppingListId;

  const RemoveItemFromShoppingList(
      {required this.shoppingListItem, required this.shoppingListId});

  @override
  List<Object> get props => [shoppingListItem, shoppingListId];
}

class AddRecipeToShoppingList extends ShoppingListEvent {
  final ShoppingRecipeItem shoppingRecipeItem;
  final String shoppingListId;

  const AddRecipeToShoppingList(
      {required this.shoppingRecipeItem, required this.shoppingListId});

  @override
  List<Object> get props => [shoppingRecipeItem, shoppingListId];
}

class RemoveRecipeFromShoppingList extends ShoppingListEvent {
  final ShoppingRecipeItem shoppingRecipeItem;
  final String shoppingListId;

  const RemoveRecipeFromShoppingList(
      {required this.shoppingRecipeItem, required this.shoppingListId});

  @override
  List<Object> get props => [shoppingRecipeItem, shoppingListId];
}

class RemoveIngredientFromShoppingRecipeItem extends ShoppingListEvent {
  final String shoppingListId;
  final ShoppingRecipeItem shoppingRecipeItem;
  final ShoppingRecipeIngredient shoppingRecipeIngredient;

  const RemoveIngredientFromShoppingRecipeItem(
      {required this.shoppingListId,
      required this.shoppingRecipeItem,
      required this.shoppingRecipeIngredient});

  @override
  List<Object> get props =>
      [shoppingListId, shoppingRecipeItem, shoppingRecipeIngredient];
}

class RemoveItemFromShoppingListByName extends ShoppingListEvent {
  final String shoppingListItemName;
  final String shoppingListId;

  const RemoveItemFromShoppingListByName(
      {required this.shoppingListItemName, required this.shoppingListId});

  @override
  List<Object> get props => [shoppingListItemName, shoppingListId];
}

class EditShoppingListNameEvent extends ShoppingListEvent {
  final ShoppingList listToEdit;
  final String shoppingListName;

  const EditShoppingListNameEvent(
      {required this.listToEdit, required this.shoppingListName});

  @override
  List<Object> get props => [listToEdit, shoppingListName];
}

class RemoveShoppingList extends ShoppingListEvent {
  final String id;

  const RemoveShoppingList({required this.id});

  @override
  List<Object> get props => [id];
}
