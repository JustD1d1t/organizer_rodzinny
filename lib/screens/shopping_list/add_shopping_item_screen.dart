import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:organizer_rodzinny/models/shopping_list_item.dart";

enum Category {
  bread(label: "Pieczywo"),
  dairy(label: "Nabiał"),
  fruit(label: "Owoce"),
  vegetables(label: "Warzywa"),
  meat(label: "Mięso"),
  fish(label: "Ryby"),
  sweets(label: "Słodycze"),
  drinks(label: "Napoje"),
  alcohol(label: "Alkohol"),
  other(label: "Inne");

  const Category({required this.label});

  final String label;
}

enum Unit {
  kg(label: "kg"),
  dag(label: "dag"),
  g(label: "g"),
  l(label: "l"),
  ml(label: "ml"),
  szt(label: "szt");

  const Unit({required this.label});

  final String label;
}

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
  var _shoppingItemQuantity = 0.0;
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
                decoration: const InputDecoration(labelText: "Jednostka"),
                value: _shoppingItemUnit,
                isExpanded: true,
                icon: const Icon(Icons.arrow_downward),
                style: Theme.of(context).textTheme.bodyLarge,
                onChanged: (value) => setState(() {
                  _shoppingItemUnit = value;
                }),
                items: Unit.values
                    .asMap()
                    .entries
                    .map<DropdownMenuItem<String>>((unit) {
                  return DropdownMenuItem<String>(
                    value: unit.value.label.toString(),
                    child: Text(unit.value.label.toString()),
                  );
                }).toList(),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Ilość"),
                maxLength: 100,
                initialValue: _shoppingItemQuantity % 1 == 0
                    ? _shoppingItemQuantity.toInt().toString()
                    : _shoppingItemQuantity.toStringAsFixed(2),
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
                  _shoppingItemQuantity = double.parse(value!);
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
                  items: Category.values
                      .asMap()
                      .entries
                      .map<DropdownMenuItem<String>>((category) {
                    return DropdownMenuItem<String>(
                      value: category.value.label.toString(),
                      child: Text(category.value.label.toString()),
                    );
                  }).toList()),
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
