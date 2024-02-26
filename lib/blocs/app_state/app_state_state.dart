part of 'app_state_bloc.dart';

class AppStateState extends Equatable {
  final String userId;
  final String currentShoppingListId;
  final ShoppingList? currentShoppingList;
  const AppStateState({
    this.userId = '',
    this.currentShoppingListId = '',
    this.currentShoppingList,
  });

  @override
  List<dynamic> get props =>
      [userId, currentShoppingListId, currentShoppingList];

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'currentShoppingListId': currentShoppingListId,
      'currentShoppingList': currentShoppingList,
    };
  }

  factory AppStateState.fromMap(Map<String, dynamic> map) {
    return AppStateState(
      userId: map['userId'],
      currentShoppingListId: map['currentShoppingListId'],
      currentShoppingList: map['currentShoppingList'],
    );
  }
}

final class AppStateInitial extends AppStateState {}
