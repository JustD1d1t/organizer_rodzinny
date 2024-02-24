import 'package:equatable/equatable.dart';
import 'package:organizer_rodzinny/blocs/bloc_exports.dart';
import 'package:organizer_rodzinny/models/shopping_list.dart';
import 'package:organizer_rodzinny/repository/firestore_repository.dart';

part 'shopping_list_event.dart';
part 'shopping_list_state.dart';

class ShoppingListBloc
    extends HydratedBloc<ShoppingListEvent, ShoppingListState> {
  ShoppingListBloc() : super(ShoppingListInitial()) {
    on<AddShoppingListEvent>(_addShoppingList);
    on<GetAllShoppingLists>(_getAllShoppingLists);
  }

  void _addShoppingList(
      AddShoppingListEvent event, Emitter<ShoppingListState> emit) async {
    await FirestoreRepository.createShoppingList(event.shoppingList);

    // List<ShoppingList> shoppingLists = state.shoppingLists;
    // emit(
    //   ShoppingListState(
    //     shoppingLists: shoppingLists..add(event.shoppingList),
    //   ),
    // );
  }

  void _getAllShoppingLists(
      GetAllShoppingLists event, Emitter<ShoppingListState> emit) async {
    List<ShoppingList> shoppingLists =
        await FirestoreRepository.getAllShoppingLists();
    print(shoppingLists);
    emit(
      ShoppingListState(
        shoppingLists: shoppingLists,
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
