import 'package:equatable/equatable.dart';
import 'package:organizer_rodzinny/blocs/bloc_exports.dart';
import 'package:organizer_rodzinny/models/Ingredient.dart';
import 'package:organizer_rodzinny/models/recipe.dart';
import 'package:organizer_rodzinny/models/shopping_list.dart';
import 'package:organizer_rodzinny/models/shopping_list_item.dart';
import 'package:organizer_rodzinny/repository/firestore_repository.dart';

// import 'package:organizer_rodzinny/repository/firestore_repository.dart';

part 'shopping_list_event.dart';
part 'shopping_list_state.dart';

class ShoppingListBloc
    extends HydratedBloc<ShoppingListEvent, ShoppingListState> {
  ShoppingListBloc() : super(const ShoppingListState()) {
    on<LoadShoppingListsEvent>(_loadShoppingLists);
    on<AddShoppingListEvent>(_addShoppingList);
    on<AddItemToShoppingList>(_addItemToShoppingList);
    on<RemoveItemFromShoppingList>(_removeItemFromShoppingList);
    on<EditShoppingListNameEvent>(_editShoppingListName);
    on<RemoveShoppingList>(_removeShoppingList);
    // on<AddRecipeToShoppingList>(_addRecipeToShoppingList);
    // on<RemoveRecipeFromShoppingList>(_removeRecipeFromShoppingList);
    // on<RemoveIngredientFromShoppingRecipeItem>(
    //     _removeIngredientFromShoppingRecipeItem);
  }
  void _loadShoppingLists(
      LoadShoppingListsEvent event, Emitter<ShoppingListState> emit) async {
    final List<ShoppingList> shoppingLists =
        await FirestoreRepository.getAllShoppingLists();
    emit(state.copyWith(shoppingLists: shoppingLists));
  }

  void _addShoppingList(
      AddShoppingListEvent event, Emitter<ShoppingListState> emit) async {
    emit(
      state.copyWith(
        shoppingLists: List.from(state.shoppingLists)..add(event.shoppingList),
      ),
    );
    await FirestoreRepository.createShoppingList(event.shoppingList);
  }

  void _addItemToShoppingList(
      AddItemToShoppingList event, Emitter<ShoppingListState> emit) async {
    final List<ShoppingList> copiedShoppingLists =
        List.from(state.shoppingLists);
    ShoppingList shoppingList = copiedShoppingLists.firstWhere(
      (element) => element.id == event.shoppingListId,
    );
    shoppingList.list.add(event.shoppingListItem);

    await FirestoreRepository.updateShoppingList(shoppingList);

    emit(
      state.copyWith(
        shoppingLists: copiedShoppingLists,
      ),
    );
  }

  void _removeItemFromShoppingList(
      RemoveItemFromShoppingList event, Emitter<ShoppingListState> emit) async {
    final List<ShoppingList> copiedShoppingLists =
        List.from(state.shoppingLists);
    ShoppingList shoppingList = copiedShoppingLists.firstWhere(
      (element) => element.id == event.shoppingListId,
    );
    shoppingList.list.remove(event.shoppingListItem);

    await FirestoreRepository.updateShoppingList(shoppingList);

    emit(
      state.copyWith(
        shoppingLists: copiedShoppingLists,
      ),
    );
  }

  void _editShoppingListName(
      EditShoppingListNameEvent event, Emitter<ShoppingListState> emit) async {
    final shoppingList = event.listToEdit;
    final shoppingListIndex = state.shoppingLists.indexOf(shoppingList);
    ShoppingList updatedShoppingList = shoppingList.copyWith(
      name: event.shoppingListName,
    );

    await FirestoreRepository.updateShoppingList(updatedShoppingList);
    emit(
      ShoppingListState(
        shoppingLists: state.shoppingLists
          ..remove(shoppingList)
          ..insert(shoppingListIndex, updatedShoppingList),
      ),
    );
  }

  void _removeShoppingList(
      RemoveShoppingList event, Emitter<ShoppingListState> emit) async {
    final List<ShoppingList> copiedShoppingLists =
        List.from(state.shoppingLists);
    ShoppingList shoppingList = copiedShoppingLists.firstWhere(
      (element) => element.id == event.id,
    );
    copiedShoppingLists.remove(shoppingList);

    await FirestoreRepository.removeShoppingList(shoppingList.id);

    emit(
      ShoppingListState(
        shoppingLists: copiedShoppingLists,
      ),
    );
  }

  // void _addRecipeToShoppingList(
  //     AddRecipeToShoppingList event, Emitter<ShoppingListState> emit) {
  //   final List<ShoppingList> copiedShoppingLists =
  //       List.from(state.shoppingLists);
  //   ShoppingList shoppingList = copiedShoppingLists.firstWhere(
  //     (element) => element.id == event.shoppingListId,
  //   );
  //   shoppingList.recipesList.add(event.shoppingRecipeItem);

  //   emit(
  //     ShoppingListState(
  //       shoppingLists: copiedShoppingLists,
  //     ),
  //   );
  // }

  // void _removeRecipeFromShoppingList(
  //     RemoveRecipeFromShoppingList event, Emitter<ShoppingListState> emit) {
  //   final List<ShoppingList> copiedShoppingLists =
  //       List.from(state.shoppingLists);
  //   ShoppingList shoppingList = copiedShoppingLists.firstWhere(
  //     (element) => element.id == event.shoppingListId,
  //   );
  //   shoppingList.recipesList.remove(event.shoppingRecipeItem);

  //   emit(
  //     ShoppingListState(
  //       shoppingLists: copiedShoppingLists,
  //     ),
  //   );
  // }

  // void _removeIngredientFromShoppingRecipeItem(
  //     RemoveIngredientFromShoppingRecipeItem event,
  //     Emitter<ShoppingListState> emit) {
  //   final List<ShoppingList> copiedShoppingLists =
  //       List.from(state.shoppingLists);
  //   ShoppingList shoppingList = copiedShoppingLists.firstWhere(
  //     (element) => element.id == event.shoppingListId,
  //   );
  //   ShoppingRecipeItem recipeItem = shoppingList.recipesList.firstWhere(
  //     (element) => element.id == event.shoppingRecipeItem.id,
  //   );
  //   recipeItem.ingredients.remove(event.ingredient);

  //   emit(
  //     ShoppingListState(
  //       shoppingLists: copiedShoppingLists,
  //     ),
  //   );
  // }

  @override
  ShoppingListState? fromJson(Map<String, dynamic> json) {
    return ShoppingListState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ShoppingListState state) {
    return state.toMap();
  }
}
