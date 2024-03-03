part of 'shopping_list_bloc.dart';

class ShoppingListState extends Equatable {
  final List<ShoppingList> shoppingLists;
  const ShoppingListState({
    this.shoppingLists = const <ShoppingList>[],
  });

  ShoppingListState copyWith({
    List<ShoppingList>? shoppingLists,
  }) {
    return ShoppingListState(
      shoppingLists: shoppingLists ?? this.shoppingLists,
    );
  }

  @override
  List<Object> get props => [shoppingLists];

  Map<String, dynamic> toMap() {
    return {
      'shoppingLists': shoppingLists.map((e) => e.toMap()).toList(),
    };
  }

  factory ShoppingListState.fromMap(Map<String, dynamic> map) {
    return ShoppingListState(
      shoppingLists: List<ShoppingList>.from(
        map['shoppingLists']?.map((x) => ShoppingList.fromMap(x)) ?? [],
      ),
    );
  }
}

final class ShoppingListInitial extends ShoppingListState {}
