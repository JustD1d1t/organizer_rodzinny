import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:organizer_rodzinny/models/shopping_list.dart';
import 'package:organizer_rodzinny/models/shopping_list_item.dart';

part 'shopping_list_state.dart';

class ShoppingListCubit extends Cubit<ShoppingListCubitState> {
  List<ShoppingList> shoppingLists = [];
  final Map<String, List<ShoppingListItem>> shoppingListItems = {};
  String currentShoppingListId = "";
  ShoppingListCubit() : super(ShoppingListInitial());

  void setCurrentShoppingListId({required String id}) {
    currentShoppingListId = id;
  }

  void addShoppingList(ShoppingList shoppingList) {
    shoppingLists.add(shoppingList);
    shoppingListItems[shoppingList.id] = shoppingList.list;
    emit(ShoppingListUpdatedState(
        shoppingLists, shoppingListItems, currentShoppingListId));
  }

  void removeShoppingList() {
    ShoppingList shoppingListToRemove = shoppingLists.firstWhere(
      (element) => element.id == currentShoppingListId,
    );
    shoppingLists.remove(shoppingListToRemove);
    if (shoppingLists.isEmpty) {
      emit(ShoppingListInitial());
    } else {
      emit(ShoppingListUpdatedState(
          shoppingLists, shoppingListItems, currentShoppingListId));
    }
  }

  void addItemToShoppingList(
    ShoppingListItem shoppingListItem,
  ) {
    Map<String, List<ShoppingListItem>> copiedShoppingListItems =
        Map.from(shoppingListItems);
    copiedShoppingListItems[currentShoppingListId]!.add(shoppingListItem);
    emit(ShoppingListUpdatedState(
        shoppingLists, copiedShoppingListItems, currentShoppingListId));
  }

  void removeItemFromShoppingList(String name) {
    Map<String, List<ShoppingListItem>> copiedShoppingListItems =
        Map.from(shoppingListItems);
    copiedShoppingListItems[currentShoppingListId]!.removeWhere((element) {
      return element.name == name;
    });
    emit(ShoppingListUpdatedState(
        shoppingLists, copiedShoppingListItems, currentShoppingListId));
  }

  void editShoppingListName(ShoppingList shoppingList, String name) {
    final shoppingListIndex = shoppingLists.indexOf(shoppingList);
    final updatedShoppingList = shoppingList.copyWith(name: name);
    final updatedShoppingLists = shoppingLists
      ..remove(shoppingList)
      ..insert(shoppingListIndex, updatedShoppingList);
    emit(ShoppingListUpdatedState(
        updatedShoppingLists, shoppingListItems, currentShoppingListId));
  }
}
