import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:organizer_rodzinny/models/shopping_list.dart';
import 'package:organizer_rodzinny/models/shopping_list_item.dart';

part 'shopping_list_state.dart';

class ShoppingListCubit extends Cubit<ShoppingListCubitState> {
  List<ShoppingList> shoppingLists = [];
  final Map<String, List<ShoppingListItem>> shoppingListItems = {};
  ShoppingListCubit() : super(ShoppingListInitial());

  void addShoppingList(ShoppingList shoppingList) {
    shoppingLists.add(shoppingList);
    shoppingListItems[shoppingList.id] = shoppingList.list;
    emit(ShoppingListUpdatedState(shoppingLists, shoppingListItems));
  }

  void removeShoppingList(ShoppingList shoppingList) {
    shoppingLists.remove(shoppingList);
    if (shoppingLists.isEmpty) {
      emit(ShoppingListInitial());
    } else {
      emit(ShoppingListUpdatedState(shoppingLists, shoppingListItems));
    }
  }

  void addItemToShoppingList(
      ShoppingListItem shoppingListItem, String shoppingListId) {
    Map<String, List<ShoppingListItem>> copiedShoppingListItems =
        Map.from(shoppingListItems);
    copiedShoppingListItems[shoppingListId]!.add(shoppingListItem);
    emit(ShoppingListUpdatedState(shoppingLists, copiedShoppingListItems));
  }

  void removeItemFromShoppingList(String name, String shoppingListId) {
    Map<String, List<ShoppingListItem>> copiedShoppingListItems =
        Map.from(shoppingListItems);
    copiedShoppingListItems[shoppingListId]!.removeWhere((element) {
      return element.name == name;
    });
    emit(ShoppingListUpdatedState(shoppingLists, copiedShoppingListItems));
  }

  void editShoppingListName(ShoppingList shoppingList, String name) {
    final shoppingListIndex = shoppingLists.indexOf(shoppingList);
    final updatedShoppingList = shoppingList.copyWith(name: name);
    final updatedShoppingLists = shoppingLists
      ..remove(shoppingList)
      ..insert(shoppingListIndex, updatedShoppingList);
    emit(ShoppingListUpdatedState(updatedShoppingLists, shoppingListItems));
  }
}
