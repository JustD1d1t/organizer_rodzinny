import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';
import 'package:organizer_rodzinny/models/shopping_list.dart';

class FirestoreRepository {
  // create shopping List
  static Future<void> createShoppingList(ShoppingList shoppingList) async {
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(
            GetStorage().read('uid'),
          )
          .collection('shopping-lists')
          .add(
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
      return shoppingLists;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
