part of 'shopping_list_bloc.dart';

abstract class ShoppingListEvent extends Equatable {
  const ShoppingListEvent();

  @override
  List<Object> get props => [];
}

class GetAllShoppingLists extends ShoppingListEvent {
  @override
  List<Object> get props => [];
}

class GetShoppingListItems extends ShoppingListEvent {
  final String shoppingListId;
  const GetShoppingListItems({required this.shoppingListId});
  @override
  List<Object> get props => [shoppingListId];
}

class AddItemToShoppingList extends ShoppingListEvent {
  final ShoppingListItem shoppingListItem;
  final ShoppingList shoppingList;

  const AddItemToShoppingList(
      {required this.shoppingListItem, required this.shoppingList});

  @override
  List<Object> get props => [shoppingListItem, shoppingList];
}

class AddRecipeToShoppingList extends ShoppingListEvent {
  final ShoppingRecipeItem shoppingRecipeItem;
  final ShoppingList shoppingList;

  const AddRecipeToShoppingList(
      {required this.shoppingRecipeItem, required this.shoppingList});

  @override
  List<Object> get props => [shoppingRecipeItem, shoppingList];
}

class AddShoppingListEvent extends ShoppingListEvent {
  final ShoppingList shoppingList;

  const AddShoppingListEvent({required this.shoppingList});

  @override
  List<Object> get props => [shoppingList];
}

class RemoveShoppingListEvent extends ShoppingListEvent {
  final ShoppingList shoppingList;

  const RemoveShoppingListEvent({required this.shoppingList});

  @override
  List<Object> get props => [shoppingList];
}

class RemoveItemFromShoppingList extends ShoppingListEvent {
  final ShoppingListItem shoppingListItem;
  final String shoppingListId;

  const RemoveItemFromShoppingList(
      {required this.shoppingListItem, required this.shoppingListId});

  @override
  List<Object> get props => [shoppingListItem, shoppingListId];
}

class RemoveRecipeItemFromShoppingList extends ShoppingListEvent {
  final ShoppingRecipeItem shoppingRecipeItem;
  final String shoppingListId;

  const RemoveRecipeItemFromShoppingList(
      {required this.shoppingRecipeItem, required this.shoppingListId});

  @override
  List<Object> get props => [shoppingRecipeItem, shoppingListId];
}

class EditShoppingListNameEvent extends ShoppingListEvent {
  final ShoppingList listToEdit;
  final String shoppingListName;

  const EditShoppingListNameEvent(
      {required this.listToEdit, required this.shoppingListName});

  @override
  List<Object> get props => [listToEdit, shoppingListName];
}
