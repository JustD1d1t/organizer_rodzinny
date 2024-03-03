import "package:flutter/material.dart";
import 'package:organizer_rodzinny/blocs/bloc_exports.dart';
import 'package:organizer_rodzinny/data/dummy_data.dart';
import 'package:organizer_rodzinny/models/shopping_list_item.dart';

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
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
              DropdownButtonFormField(
                  decoration: const InputDecoration(labelText: "Kategoria"),
                  value: _shoppingItemCategory,
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_downward),
                  style: Theme.of(context).textTheme.bodyLarge,
                  onChanged: (value) => setState(() {
                        _shoppingItemCategory = value;
                      }),
                  items: availableCategories
                      .map((cat) => DropdownMenuItem<String>(
                            value: cat['name'].toString(),
                            child: Text(cat['name'].toString()),
                          ))
                      .toList()),
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
              // const Text('Wybierz z listy'),
              // ...availableCategories
              //     .map(
              //       (cat) => ListTile(
              //         title: Text(cat['name'].toString()),
              //         onTap: () {},
              //         trailing: const Icon(Icons.arrow_forward),
              //       ),
              //     )
              //     .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
