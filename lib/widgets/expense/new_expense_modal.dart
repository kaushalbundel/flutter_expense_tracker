import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

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
  DateTime? _selectedDate;
  Category _selectedCategoryValue = Category.client;

  // show date picker is different to the other widgets in as it returns a value from future
  // Why setState is called? Because we need to print the value on the screen as we recieve that from date picker and that will need a screen rebuild/ state change
  void _showDateModal() async {
    final currentDate = DateTime.now();
    final lastDate = DateTime(
      currentDate.year + 1,
      currentDate.month,
      currentDate.day,
    );

    final pickedDate = await showDatePicker(
      context: context,
      firstDate: currentDate,
      lastDate: lastDate,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _setCategory(Category? value) {
    if (value == null) {
      return;
    }
    setState(() {
      _selectedCategoryValue = value;
    });
  }

  // validating new expense addition and producing an error when an issue is encountered
  // the function should run when "save expense" button is clicked as the expenses are saved
  // there is not need to check the category as it comes prefilled but however the logic could be improved
  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final checkEnteredAmount = enteredAmount == null || enteredAmount <= 0
        ? true
        : false;
    if (checkEnteredAmount ||
        _titleController.text.trim().isEmpty ||
        _selectedDate == null) {
      // error
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text("Invalid Response"),
            content: const Text("Please add correct details and resubmit"),
            actions: [
              TextButton(
                child: const Text("Close"),
                onPressed: () {
                  Navigator.pop(ctx);
                },
              ),
            ],
          );
        },
      );
    }
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
                    Text(
                      (_selectedDate == null)
                          ? "No Date selected"
                          : dateFormat.format(
                              _selectedDate!,
                            ), // since we know that the _selectedDate can not be null, we have put in an additional emphassis with !
                    ),
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
              DropdownButton(
                value: _selectedCategoryValue,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name),
                      ),
                    )
                    .toList(),
                onChanged: _setCategory,
              ),
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  _submitExpenseData;
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
