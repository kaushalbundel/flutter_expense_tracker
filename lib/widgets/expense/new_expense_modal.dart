import 'package:flutter/material.dart';

/* The class provides the bottom modal for adding new expenses */

class NewExpenseModal extends StatefulWidget {
  const NewExpenseModal({super.key});

  @override
  State<NewExpenseModal> createState() {
    return _NewExpenseModalState();
  }
}

class _NewExpenseModalState extends State<NewExpenseModal> {
  // storing the value entered in the text field
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.all(12.0),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(label: Text("Title")),
            keyboardType: TextInputType.name,
            maxLength: 50,
            controller: _titleController,
          ),
          TextField(
            decoration: const InputDecoration(label: Text("Amount (in \$)")),
            keyboardType: TextInputType.number,
            maxLength: 7,
            controller: _amountController,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                  print(_amountController.text);
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
