import "package:flutter/material.dart";
import "package:organizer_rodzinny/models/shopping_list.dart";

class EditShoppingListName extends StatefulWidget {
  const EditShoppingListName({super.key, required this.listToEdit});

  final ShoppingList listToEdit;

  @override
  State<EditShoppingListName> createState() => _EditShoppingListNameState();
}

class _EditShoppingListNameState extends State<EditShoppingListName> {
  final _formKey = GlobalKey<FormState>();

  var _shoppingListName = "";

  void _saveForm() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();

    Navigator.of(context).pop(
      ShoppingList(
        list: widget.listToEdit.list,
        name: _shoppingListName,
        recipesList: widget.listToEdit.recipesList,
        id: '1234',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 8,
          right: 8,
          top: 8,
        ),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: "Nazwa listy"),
              textInputAction: TextInputAction.next,
              maxLength: 50,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value.trim().length <= 2 ||
                    value.trim().length > 50) {
                  return 'Must be between 2 and 50 characters.';
                }
                return null;
              },
              onSaved: (value) {
                _shoppingListName = value!;
              },
            ),
            ElevatedButton(
              onPressed: _saveForm,
              child: const Text("Zmień nazwę"),
            ),
          ],
        ),
      ),
    );
  }
}
