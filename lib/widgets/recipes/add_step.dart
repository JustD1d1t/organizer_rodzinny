import "package:flutter/material.dart";

class AddStep extends StatefulWidget {
  const AddStep({super.key});

  @override
  State<AddStep> createState() => _AddStepState();
}

class _AddStepState extends State<AddStep> {
  final _formKey = GlobalKey<FormState>();

  var _ingredientName = "";

  void _saveForm() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();

    Navigator.of(context).pop(
      _ingredientName,
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
              decoration: const InputDecoration(labelText: "Krok"),
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
                _ingredientName = value!;
              },
            ),
            ElevatedButton(
              onPressed: _saveForm,
              child: const Text("Dodaj krok"),
            ),
          ],
        ),
      ),
    );
  }
}
