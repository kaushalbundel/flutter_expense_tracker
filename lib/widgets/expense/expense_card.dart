import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({super.key, required this.expenseValues});

  final DataExpense expenseValues;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(
        horizontal: 8.0,
        vertical: 8.0,
      ),
      child: SizedBox(
        height: 100,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(expenseValues.title, textAlign: TextAlign.center),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("\$${expenseValues.amount.toStringAsFixed(2)}"),
                  Row(
                    children: [
                      Icon(categoryIcons[expenseValues.category]),
                      const SizedBox(width: 8),
                      Text(expenseValues.formattedDate),
                    ],
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
