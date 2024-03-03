import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';
import 'package:organizer_rodzinny/models/shopping_list.dart';
import 'package:organizer_rodzinny/models/shopping_list_item.dart';

class FirestoreRepository {
  // create shopping List
  static Future<void> createShoppingList(ShoppingList shoppingList) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(
            GetStorage().read('uid'),
          )
          .collection('shopping-lists')
          .doc(shoppingList.id)
          .set(
            shoppingList.toMap(),
          );
    } catch (e) {}
  }

  static Future<List<ShoppingList>> getAllShoppingLists() async {
    List<ShoppingList> shoppingLists = [];
    try {
      final data = await FirebaseFirestore.instance
          .collection('users')
          .doc(GetStorage().read('uid'))
          .collection('shopping-lists')
          .get();
      for (var shoppingList in data.docs) {
        shoppingLists.add(
          ShoppingList.fromMap(
            shoppingList.data(),
          ),
        );
      }
      // print(shoppingLists);
      return shoppingLists;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<ShoppingList> updateShoppingList(updatedShoppingList) async {
    ShoppingList shoppingList = ShoppingList(
      name: '',
      list: [],
      id: '',
    );
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(GetStorage().read('uid'))
          .collection('shopping-lists')
          .doc(updatedShoppingList.id)
          .update(
            updatedShoppingList.toMap(),
          );

      return shoppingList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<void> addItemToShoppingList(
      ShoppingListItem shoppingListItem, String shoppingListId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(GetStorage().read('uid'))
          .collection('shopping-lists')
          .doc(shoppingListId)
          .update(
        {
          'list': FieldValue.arrayUnion([shoppingListItem.toMap()]),
        },
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<void> removeShoppingList(
    String shoppingListId,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(GetStorage().read('uid'))
          .collection('shopping-lists')
          .doc(shoppingListId)
          .delete();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
