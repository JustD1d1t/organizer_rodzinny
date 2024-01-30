import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:organizer_rodzinny/data/dummy_data.dart";
import "package:organizer_rodzinny/models/shopping_list_item.dart";

class AddShopingItemScreen extends StatefulWidget {
  const AddShopingItemScreen({
    super.key,
    required this.appBarTitle,
    this.shoppingListItem,
  });
  final ShoppingListItem? shoppingListItem;
  final String appBarTitle;

  @override
  State<AddShopingItemScreen> createState() => _AddShopingItemScreenState();
}

class _AddShopingItemScreenState extends State<AddShopingItemScreen> {
  final _formKey = GlobalKey<FormState>();

  var _shoppingItemName;
  var _shoppingItemQuantity;
  var _shoppingItemUnit;
  var _shoppingItemCategory;
  var _shoppingItemChecked;

  @override
  void initState() {
    super.initState();
    if (widget.shoppingListItem != null) {
      _shoppingItemName = widget.shoppingListItem!.name;
      _shoppingItemQuantity = widget.shoppingListItem!.quantity;
      _shoppingItemUnit = widget.shoppingListItem!.unit;
      _shoppingItemCategory = widget.shoppingListItem!.category;
      _shoppingItemChecked = widget.shoppingListItem!.checked;
    } else {
      _shoppingItemChecked = false;
    }
  }

  void _saveForm() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    _formKey.currentState!.save();

    Navigator.of(context).pop(
      ShoppingListItem(
        name: _shoppingItemName,
        quantity: _shoppingItemQuantity,
        unit: _shoppingItemUnit,
        checked: _shoppingItemChecked,
        category: _shoppingItemCategory,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Nazwa"),
                maxLength: 30,
                initialValue: _shoppingItemName,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 5 ||
                      value.trim().length > 30) {
                    return 'Must be between 5 and 30 characters.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _shoppingItemName = value!;
                },
              ),
              DropdownButtonFormField(
                  decoration: const InputDecoration(labelText: "Jednostka"),
                  // TODO: problem z initial value
                  // value: _shoppingItemUnit,
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_downward),
                  style: Theme.of(context).textTheme.bodyLarge,
                  onChanged: (value) => setState(() {
                        _shoppingItemUnit = value;
                      }),
                  items: categoryList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList()),
              TextFormField(
                decoration: const InputDecoration(labelText: "Ilość"),
                maxLength: 100,
                initialValue: _shoppingItemQuantity.toString(),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'(^-?\d*\.?\d*)'))
                ],
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      double.parse(value) < 0) {
                    return 'Musisz podać ilość.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _shoppingItemQuantity = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Kategoria"),
                maxLength: 100,
                initialValue: _shoppingItemCategory,
                keyboardType: TextInputType.name,
                onSaved: (value) {
                  _shoppingItemCategory = value!;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: _saveForm,
                    child: const Text("Zapisz"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
