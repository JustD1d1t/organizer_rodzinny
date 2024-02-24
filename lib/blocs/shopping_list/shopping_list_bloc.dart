import 'package:equatable/equatable.dart';
import 'package:organizer_rodzinny/blocs/bloc_exports.dart';
import 'package:organizer_rodzinny/models/Ingredient.dart';
import 'package:organizer_rodzinny/models/shopping_list.dart';
import 'package:organizer_rodzinny/models/shopping_list_item.dart';
import 'package:organizer_rodzinny/repository/firestore_repository.dart';

part 'shopping_list_event.dart';
part 'shopping_list_state.dart';

class ShoppingListBloc
    extends HydratedBloc<ShoppingListEvent, ShoppingListState> {
  ShoppingListBloc() : super(ShoppingListInitial()) {
    on<AddShoppingListEvent>(_addShoppingList);
    on<GetAllShoppingLists>(_getAllShoppingLists);
    on<AddItemToShoppingList>(_addItemToShoppingList);
    on<GetShoppingListItems>(_getShoppingListItems);
  }

  void _getAllShoppingLists(
      GetAllShoppingLists event, Emitter<ShoppingListState> emit) async {
    List<ShoppingList> shoppingLists =
        await FirestoreRepository.getAllShoppingLists();
    emit(
      ShoppingListState(
        shoppingLists: shoppingLists,
      ),
    );
  }

  void _getShoppingListItems(
      GetShoppingListItems event, Emitter<ShoppingListState> emit) async {
    List<ShoppingListItem> shoppingListItems = [];
    List<ShoppingRecipeIngredient> shoppingRecipeIngredients = [];
    final res =
        await FirestoreRepository.getShoppingListItems(event.shoppingListId)
            .then((value) {
      shoppingListItems = value['shoppingListItems']!.cast<ShoppingListItem>();
      shoppingRecipeIngredients =
          value['shoppingRecipeIngredients']!.cast<ShoppingRecipeIngredient>();
    });
    emit(
      ShoppingListState(
        shoppingLists: state.shoppingLists,
        shoppingListItems: shoppingListItems,
        shoppingRecipeIngredients: shoppingRecipeIngredients,
      ),
    );
  }

  void _addShoppingList(
      AddShoppingListEvent event, Emitter<ShoppingListState> emit) async {
    await FirestoreRepository.createShoppingList(event.shoppingList);
  }

  void _addItemToShoppingList(
      AddItemToShoppingList event, Emitter<ShoppingListState> emit) async {
    final state = this.state;
    final shoppingList = event.shoppingList;
    final shoppingListItem = event.shoppingListItem;
    final shoppingListIndex = state.shoppingLists.indexOf(shoppingList);
    final updatedShoppingList = shoppingList
      ..copyWith(
        list: shoppingList.list..add(shoppingListItem),
      );
    state.shoppingLists
      ..remove(shoppingList)
      ..insert(
        shoppingListIndex,
        updatedShoppingList,
      );

    await FirestoreRepository.updateShoppingList(
      updatedShoppingList,
    );
    //TODO: update only shoppingListItems
    emit(
      ShoppingListState(
        shoppingLists: state.shoppingLists,
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
