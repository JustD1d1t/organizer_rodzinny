import "dart:core";

import 'package:equatable/equatable.dart';
import "package:organizer_rodzinny/models/shopping_list_item.dart";
import "package:uuid/uuid.dart";

const uuid = Uuid();

// ignore: must_be_immutable
class ShoppingList extends Equatable {
  final String name;
  // TODO: remove list and recipesList properties - keep them separate in state in order to prevent multiple sources of truth
  final List<ShoppingListItem> list;
  String id;

  ShoppingList({
    required this.name,
    required this.list,
    required this.id,
  }) {
    id = id.isEmpty ? uuid.v4() : id;
  }

  ShoppingList copyWith({
    String? name,
    List<ShoppingListItem>? list,
    String? id,
  }) {
    return ShoppingList(
      name: name ?? this.name,
      list: list ?? this.list,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "name": name,
      "list": list
          .map((e) => ({
                "id": e.id,
                "name": e.name,
                "category": e.category,
                "checked": e.checked,
              }))
          .toList(),
      "id": id,
    };
  }

  factory ShoppingList.fromMap(Map<String, dynamic> map) {
    return ShoppingList(
      name: map["name"] ?? '',
      list: List<ShoppingListItem>.from(
              map["list"].map((item) => ShoppingListItem.fromMap(item))) ??
          [],
      id: map["id"] ?? '',
    );
  }

  @override
  List<Object?> get props => [name, list, id];
}
