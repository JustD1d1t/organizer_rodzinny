part of 'app_state_bloc.dart';

sealed class AppStateEvent extends Equatable {
  const AppStateEvent();

  @override
  List<Object> get props => [];
}

class SetUserId extends AppStateEvent {
  final String id;
  const SetUserId({required this.id});

  @override
  List<Object> get props => [id];
}

class SetCurrentShoppingListId extends AppStateEvent {
  final String id;
  const SetCurrentShoppingListId({required this.id});

  @override
  List<Object> get props => [id];
}

class SetCurrentShoppingList extends AppStateEvent {
  final dynamic shoppingList;
  const SetCurrentShoppingList({required this.shoppingList});

  @override
  List<Object> get props => [shoppingList];
}

class GetUserId extends AppStateEvent {
  final String id;
  const GetUserId({required this.id});

  @override
  List<Object> get props => [id];
}
