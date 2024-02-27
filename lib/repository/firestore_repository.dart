import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';
import 'package:organizer_rodzinny/models/Ingredient.dart';
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
      recipesList: [],
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

  static Future<Map<String, List<dynamic>>> getShoppingListItems(
      shoppingListId) async {
    List<ShoppingListItem> shoppingListItems = [];
    List<ShoppingRecipeIngredient> shoppingRecipeIngredients = [];
    try {
      final shoppingListSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(GetStorage().read('uid'))
          .collection('shopping-lists')
          .doc(shoppingListId)
          .get();
      if (shoppingListSnapshot.exists) {
        final shoppingListData =
            shoppingListSnapshot.data() as Map<String, dynamic>;
        final list = shoppingListSnapshot['list'];
        final recipeList = shoppingListSnapshot['recipesList'];
        for (var item in list) {
          shoppingListItems.add(
            ShoppingListItem.fromMap(
              item,
            ),
          );
        }
        for (var item in recipeList) {
          shoppingRecipeIngredients.add(
            ShoppingRecipeIngredient.fromMap(
              item,
            ),
          );
        }
      }
      return {
        'shoppingListItems': shoppingListItems,
        'shoppingRecipeIngredients': shoppingRecipeIngredients
      };
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
