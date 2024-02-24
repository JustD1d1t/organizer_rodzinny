part of 'shopping_list_bloc.dart';

abstract class ShoppingListEvent extends Equatable {
  const ShoppingListEvent();

  @override
  List<Object> get props => [];
}

class AddShoppingListEvent extends ShoppingListEvent {
  final ShoppingList shoppingList;

  const AddShoppingListEvent({required this.shoppingList});

  @override
  List<Object> get props => [shoppingList];
}

class GetAllShoppingLists extends ShoppingListEvent {
  @override
  List<Object> get props => [];
}
