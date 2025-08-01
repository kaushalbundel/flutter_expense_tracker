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

  // method to add an overlay button when the add button is pressed

  void _addBottomModal() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return const NewExpenseModal();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
            ExpenseListView(listExpenses: registeredExpenses),
          ],
        ),
      ),
    );
  }
}
