import 'package:equatable/equatable.dart';
import 'package:organizer_rodzinny/blocs/bloc_exports.dart';
import 'package:organizer_rodzinny/models/recipe.dart';
import 'package:organizer_rodzinny/models/shopping_list.dart';
import 'package:organizer_rodzinny/models/shopping_list_item.dart';

// import 'package:organizer_rodzinny/repository/firestore_repository.dart';

part 'shopping_list_event.dart';
part 'shopping_list_state.dart';

class ShoppingListBloc
    extends HydratedBloc<ShoppingListEvent, ShoppingListState> {
  ShoppingListBloc() : super(ShoppingListInitial()) {
    on<AddShoppingListEvent>(_addShoppingList);
    on<AddItemToShoppingList>(_addItemToShoppingList);
    on<AddRecipeToShoppingList>(_addRecipeToShoppingList);
    on<RemoveShoppingListEvent>(_removeShoppingList);
    on<RemoveItemFromShoppingList>(_removeItemFromShoppingList);
    on<RemoveRecipeItemFromShoppingList>(_removeRecipeItemFromShoppingList);
    on<GetAllShoppingLists>(_getAllShoppingLists);
    on<GetShoppingListItems>(_getShoppingListItems);
    on<EditShoppingListNameEvent>(_editShoppingListName);
  }

  void _getAllShoppingLists(
      GetAllShoppingLists event, Emitter<ShoppingListState> emit) async {
    // List<ShoppingList> shoppingLists =
    //     await FirestoreRepository.getAllShoppingLists();
    // emit(
    //   ShoppingListState(
    //     shoppingLists: shoppingLists,
    //   ),
    // );
  }

  void _getShoppingListItems(
      GetShoppingListItems event, Emitter<ShoppingListState> emit) async {
    List<ShoppingListItem> shoppingListItems = [];
    List<ShoppingRecipeItem> shoppingRecipeItems = [];
    // final res =
    //     await FirestoreRepository.getShoppingListItems(event.shoppingListId)
    //         .then((value) {
    //   shoppingListItems = value['shoppingListItems']!.cast<ShoppingListItem>();
    //   shoppingRecipeIngredients =
    //       value['shoppingRecipeIngredients']!.cast<ShoppingRecipeIngredient>();
    // });
    emit(
      ShoppingListState(
        shoppingLists: state.shoppingLists,
        shoppingListItems: shoppingListItems,
        shoppingRecipeItems: shoppingRecipeItems,
      ),
    );
  }

  void _addShoppingList(
      AddShoppingListEvent event, Emitter<ShoppingListState> emit) async {
    final shoppingListToAdd = event.shoppingList;
    List<ShoppingList> shoppingLists = state.shoppingLists;
    shoppingLists.add(shoppingListToAdd);
    emit(
      ShoppingListState(
        shoppingLists: shoppingLists,
        shoppingListItems: state.shoppingListItems,
        shoppingRecipeItems: state.shoppingRecipeItems,
      ),
    );
    // await FirestoreRepository.createShoppingList(event.shoppingList);
  }

  void _addItemToShoppingList(
      AddItemToShoppingList event, Emitter<ShoppingListState> emit) async {
    final shoppingList = event.shoppingList;
    final shoppingListItem = event.shoppingListItem;
    final shoppingListIndex = state.shoppingLists.indexOf(shoppingList);
    shoppingList.list.add(shoppingListItem);
    // await FirestoreRepository.updateShoppingList(shoppingList);
    emit(
      ShoppingListState(
        shoppingLists: state.shoppingLists
          ..remove(shoppingList)
          ..insert(shoppingListIndex, shoppingList),
        shoppingListItems: state.shoppingListItems,
        shoppingRecipeItems: state.shoppingRecipeItems,
      ),
    );
  }

  void _addRecipeToShoppingList(
      AddRecipeToShoppingList event, Emitter<ShoppingListState> emit) async {
    final shoppingList = event.shoppingList;
    final shoppingRecipeItem = event.shoppingRecipeItem;
    final shoppingListIndex = state.shoppingLists.indexOf(shoppingList);
    shoppingList.recipesList.add(shoppingRecipeItem);
    // await FirestoreRepository.updateShoppingList(shoppingList);
    emit(
      ShoppingListState(
        shoppingLists: state.shoppingLists
          ..remove(shoppingList)
          ..insert(shoppingListIndex, shoppingList),
        shoppingListItems: state.shoppingListItems,
        shoppingRecipeItems: state.shoppingRecipeItems,
      ),
    );
  }

  void _removeItemFromShoppingList(
      RemoveItemFromShoppingList event, Emitter<ShoppingListState> emit) async {
    final shoppingListId = event.shoppingListId;
    final shoppingListItem = event.shoppingListItem;
    ShoppingList shoppingList = state.shoppingLists
        .where((shoppingList) => shoppingList.id == shoppingListId)
        .single;
    final shoppingListIndex = state.shoppingLists.indexOf(shoppingList);
    ShoppingList updatedShoppingList = shoppingList.copyWith(
      list: shoppingList.list..remove(shoppingListItem),
    );
    emit(
      ShoppingListState(
        shoppingLists: state.shoppingLists
          ..remove(shoppingList)
          ..insert(shoppingListIndex, updatedShoppingList),
        shoppingListItems: state.shoppingListItems,
        shoppingRecipeItems: state.shoppingRecipeItems,
      ),
    );
  }

  void _removeRecipeItemFromShoppingList(
      RemoveRecipeItemFromShoppingList event, Emitter<ShoppingListState> emit) {
    final shoppingListId = event.shoppingListId;
    final shoppingRecipeItem = event.shoppingRecipeItem;
    ShoppingList shoppingList = state.shoppingLists
        .where((shoppingList) => shoppingList.id == shoppingListId)
        .single;
    final shoppingListIndex = state.shoppingLists.indexOf(shoppingList);
    ShoppingList updatedShoppingList = shoppingList.copyWith(
      recipesList: shoppingList.recipesList..remove(shoppingRecipeItem),
    );
    emit(
      ShoppingListState(
        shoppingLists: state.shoppingLists
          ..remove(shoppingList)
          ..insert(shoppingListIndex, updatedShoppingList),
        shoppingListItems: state.shoppingListItems,
        shoppingRecipeItems: state.shoppingRecipeItems,
      ),
    );
  }

  void _removeShoppingList(
      RemoveShoppingListEvent event, Emitter<ShoppingListState> emit) async {
    final shoppingListToRemove = event.shoppingList;
    List<ShoppingList> shoppingLists = state.shoppingLists;
    shoppingLists.remove(shoppingListToRemove);
    emit(
      ShoppingListState(
        shoppingLists: shoppingLists,
        shoppingListItems: state.shoppingListItems,
        shoppingRecipeItems: state.shoppingRecipeItems,
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
    emit(
      ShoppingListState(
        shoppingLists: state.shoppingLists
          ..remove(shoppingList)
          ..insert(shoppingListIndex, updatedShoppingList),
        shoppingListItems: state.shoppingListItems,
        shoppingRecipeItems: state.shoppingRecipeItems,
      ),
    );
  }

  @override
  ShoppingListState? fromJson(Map<String, dynamic> json) {
    return ShoppingListState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ShoppingListState state) {
    return state.toMap();
  }
}
