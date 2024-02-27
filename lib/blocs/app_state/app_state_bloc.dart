import 'package:equatable/equatable.dart';
import 'package:organizer_rodzinny/blocs/bloc_exports.dart';
import 'package:organizer_rodzinny/models/shopping_list.dart';

part 'app_state_event.dart';
part 'app_state_state.dart';

class AppStateBloc extends HydratedBloc<AppStateEvent, AppStateState> {
  AppStateBloc() : super(AppStateInitial()) {
    on<SetUserId>(_setUserId);
    on<SetCurrentShoppingListId>(_setCurrentShoppingListId);
    on<SetCurrentShoppingList>(_setCurrentShoppingList);
    on<GetUserId>(_getUserId);
  }

  void _setUserId(SetUserId event, Emitter<AppStateState> emit) async {
    emit(
      AppStateState(
        userId: event.id,
        currentShoppingListId: state.currentShoppingListId,
        currentShoppingList: state.currentShoppingList,
      ),
    );
  }

  _setCurrentShoppingListId(
      SetCurrentShoppingListId event, Emitter<AppStateState> emit) async {
    emit(
      AppStateState(
        userId: state.userId,
        currentShoppingListId: event.id,
        currentShoppingList: state.currentShoppingList,
      ),
    );
  }

  _setCurrentShoppingList(
      SetCurrentShoppingList event, Emitter<AppStateState> emit) async {
    print(event.shoppingList);
    emit(
      AppStateState(
        userId: state.userId,
        currentShoppingListId: state.currentShoppingListId,
        currentShoppingList: event.shoppingList,
      ),
    );
    print(state.currentShoppingList);
  }

  void _getUserId(GetUserId event, Emitter<AppStateState> emit) async {
    emit(
      AppStateState(
        userId: state.userId,
      ),
    );
  }

  @override
  AppStateState? fromJson(Map<String, dynamic> json) {
    return AppStateState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(AppStateState state) {
    return state.toMap();
  }
}
