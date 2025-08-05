import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expense/expense_card.dart';

/* This class captures the list view of the active expenses on the home screen in a list view. */

class ExpenseListView extends StatelessWidget {
  const ExpenseListView({
    super.key,
    required this.listExpenses,
    required this.onRemovalExpense,
  });

  // The list view accept a list
  final List<DataExpense> listExpenses;

  //function to remove the list of expenses by swiping them
  final void Function(DataExpense expense) onRemovalExpense;

  @override
  Widget build(BuildContext context) {
    // list view builder is used since we do not know the count of expenses that we have along with lazily reproducing the list
    return Expanded(
      child: ListView.builder(
        itemCount: listExpenses.length,
        itemBuilder: (ctx, index) => Dismissible(
          onDismissed: (direction) {
            onRemovalExpense; // test this
          },
          key: ValueKey(index),
          child: ExpenseCard(expenseValues: listExpenses[index]),
        ),
      ),
    );
  }
}
