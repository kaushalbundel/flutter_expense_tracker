import 'package:expense_tracker/widgets/expense/expense_list_view.dart';
import 'package:expense_tracker/widgets/expense/new_expense_modal.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

/*
The objective of this widget is to  capture all the related widgets from where:

1. The graphical representation of the expenses can be documented
2. Expenses can be added
3. Expenses can be shown in a list view
4. Expenses can be deleted

Main Tasks:

1. All other required states will be uplifted to this state. Why? Since this state is common to all of the needed widgets.
*/

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  // dummy data
  final List<DataExpense> registeredExpenses = [
    DataExpense(
      title: "Medical-Fever",
      amount: 500.0,
      date: DateTime.now(),
      category: Category.personal,
    ),
    DataExpense(
      title: "Utilities-Electricity",
      amount: 1999,
      date: DateTime.now(),
      category: Category.home,
    ),
    DataExpense(
      title: "Outing",
      amount: 4000,
      date: DateTime.now(),
      category: Category.home,
    ),
    DataExpense(
      title: "Client-Dinner",
      amount: 500.0,
      date: DateTime.now(),
      category: Category.client,
    ),
  ];

  // logic for getting the data after creating the date in new expense modal
  void _newSavedExpense(DataExpense newExpense) {
    setState(() {
      registeredExpenses.add(newExpense);
    });
  }

  // logic for removing the data once the expense is swiped with an ability to undo the swiping/deletion
  void _expenseRemove(DataExpense expense) {
    var expenseItemIndex = registeredExpenses.indexOf(expense);

    setState(() {
      registeredExpenses.remove(expense);
    });
    // clear the snackbars if more than one snack bar is opened at a time
    ScaffoldMessenger.of(context).clearSnackBars();
    //undo process
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Expense item ${expense.title} is deleted"),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              registeredExpenses.insert(expenseItemIndex, expense);
            });
          },
        ),
      ),
    );
  }

  // method to add an overlay button when the add button is pressed
  void _addBottomModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return NewExpenseModal(onExpenseAdd: _newSavedExpense);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // adding a default value to the expense screen so that when there are no expenses there are still some details visible
    Widget mainContent = const Center(child: Text("Please add new expenses."));
    // logic for capturing the main content when there are no expense in the expense list (registeredExpenses)
    if (registeredExpenses.isNotEmpty) {
      mainContent = ExpenseListView(
        listExpenses: registeredExpenses,
        onRemovalExpense: _expenseRemove,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: _addBottomModal, icon: const Icon(Icons.add)),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Graph Widget space"),
            const SizedBox(height: 20),
            mainContent,
          ],
        ),
      ),
    );
  }
}
