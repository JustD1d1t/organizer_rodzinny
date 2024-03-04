import "package:flutter/material.dart";
import 'package:organizer_rodzinny/blocs/bloc_exports.dart';
import 'package:organizer_rodzinny/data/dummy_data.dart';
import 'package:organizer_rodzinny/models/shopping_list_item.dart';
import 'package:organizer_rodzinny/widgets/shopping_list/add_shopping_items/add_item_tile.dart';

class AddShoppingItemScreen extends StatefulWidget {
  const AddShoppingItemScreen({
    super.key,
  });

  static const id = "add_shopping_item_screen";

  @override
  State<AddShoppingItemScreen> createState() => _AddShoppingItemScreenState();
}

class _AddShoppingItemScreenState extends State<AddShoppingItemScreen> {
  final _formKey = GlobalKey<FormState>();

  var _shoppingItemName;
  var _shoppingItemCategory;

  void _saveForm() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    _formKey.currentState!.save();
    final id = context.read<AppStateBloc>().state.currentShoppingListId;
    context.read<ShoppingListBloc>().add(
          AddItemToShoppingList(
            shoppingListItem: ShoppingListItem(
              name: _shoppingItemName,
              checked: false,
              category: _shoppingItemCategory,
              id: "",
            ),
            shoppingListId: id,
          ),
        );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dodaj element'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                child: ExpansionPanelList.radio(
                  children: availableCategories.map((cat) {
                    return ExpansionPanelRadio(
                      value: cat['name'].toString(),
                      canTapOnHeader: true,
                      headerBuilder: (context, isExpanded) {
                        return ListTile(
                          title: Text(cat['name'].toString()),
                        );
                      },
                      body: GridView(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 1,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        children: [
                          // TODO: Why map is not working?
                          for (var item in (cat['items'] as List))
                            AddItemTile(
                              item: item,
                              isActive: context
                                  .read<ShoppingListBloc>()
                                  .state
                                  .shoppingListItems[context
                                      .read<AppStateBloc>()
                                      .state
                                      .currentShoppingListId]!
                                  .any((element) =>
                                      element.name == item['name']),
                              onSelectTile: () {
                                _shoppingItemCategory = item['name'].toString();
                              },
                            ),
                        ],
                      ),
                    );
                  }).toList(),
                )),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Dodaj własny produkt'),
                        TextFormField(
                          decoration: const InputDecoration(labelText: "Nazwa"),
                          maxLength: 30,
                          initialValue: _shoppingItemName,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.trim().length <= 2 ||
                                value.trim().length > 30) {
                              return 'Must be between 3 and 30 characters.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _shoppingItemName = value!;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                _saveForm();
                              },
                              child: const Text("Zapisz"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
