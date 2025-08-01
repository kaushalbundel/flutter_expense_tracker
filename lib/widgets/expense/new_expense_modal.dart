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

  void _showDateModal() {
    final currentDate = DateTime.now();
    final lastDate = DateTime(
      currentDate.year + 1,
      currentDate.month,
      currentDate.day,
    );

    showDatePicker(
      context: context,
      firstDate: currentDate,
      lastDate: lastDate,
    );
  }

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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 1,
                child: TextField(
                  decoration: const InputDecoration(
                    label: Text("Amount (in \$)"),
                    prefixText: "\$ ",
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 7,
                  controller: _amountController,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    const Text("Select Date"),
                    IconButton(
                      onPressed: _showDateModal,
                      icon: const Icon(Icons.date_range),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  print(_titleController);
                  print(_amountController.text);
                },
                child: const Text("Submit"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Close"),
              ), // TODO: As the form is closed the stored values should disappear
            ],
          ),
        ],
      ),
    );
  }
}
