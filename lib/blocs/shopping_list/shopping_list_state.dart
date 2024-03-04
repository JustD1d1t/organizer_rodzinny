part of 'shopping_list_bloc.dart';

class ShoppingListState extends Equatable {
  final List<ShoppingList> shoppingLists;
  final Map<String, List<ShoppingListItem>> shoppingListItems;
  const ShoppingListState({
    this.shoppingLists = const <ShoppingList>[],
    this.shoppingListItems = const <String, List<ShoppingListItem>>{},
  });

  ShoppingListState copyWith({
    List<ShoppingList>? shoppingLists,
  }) {
    return ShoppingListState(
      shoppingLists: shoppingLists ?? this.shoppingLists,
      shoppingListItems: shoppingListItems,
    );
  }

  @override
  List<Object> get props => [shoppingLists, shoppingListItems];

  Map<String, dynamic> toMap() {
    return {
      'shoppingLists': shoppingLists.map((e) => e.toMap()).toList(),
      'shoppingListItems': shoppingListItems.map(
        (k, v) {
          return MapEntry(k, v.map((e) => e.toMap()).toList());
        },
      ),
    };
  }

  factory ShoppingListState.fromMap(Map<String, dynamic> map) {
    return ShoppingListState(
      shoppingLists: List<ShoppingList>.from(
        map['shoppingLists']?.map((x) => ShoppingList.fromMap(x)) ?? [],
      ),
      shoppingListItems: Map<String, List<ShoppingListItem>>.from(
        map['shoppingListItems']?.map((k, v) {
              return MapEntry(
                k,
                List<ShoppingListItem>.from(
                  v.map((x) => ShoppingListItem.fromMap(x)),
                ),
              );
            }) ??
            {},
      ),
    );
  }
}

final class ShoppingListInitial extends ShoppingListState {}
