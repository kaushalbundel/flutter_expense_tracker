import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

/* Data class for capturing Expense related data points */

final uuid = const Uuid();
var dateFormat =
    DateFormat.yMd(); // this date format can be globally defined as it does not need in any class

enum Category { home, client, vehicle, personal }

final categoryIcons = {
  Category.client: Icons.face_4,
  Category.home: Icons.home_filled,
  Category.personal: Icons.person,
  Category.vehicle: Icons.electric_bike,
};

class DataExpense {
  DataExpense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid
           .v4(); // this a special method for initialization for the properties that are auto-initialized

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate => dateFormat.format(date);
}

// Creating Graph graph shows the sum of all value of for each individual category
class ExpenseBucket {
  ExpenseBucket({required this.category, required this.expenses});

  //customized initializer: takes the list of all expenses and creates a separate list where the catogory is the category mentioned
  ExpenseBucket.forCategory(List<DataExpense> allExpenses, this.category)
    : expenses = allExpenses
          .where((expenses) => expenses.category == category)
          .toList();

  // To capture the expenses, I need to first get the total expenses and then do the sum of all expenses against inidividual categories
  final Category category;
  final List<DataExpense> expenses;

  // getter to get the value of the expense against a specific category
  double get totalExpense {
    double sum = 0;

    for (final expense in expenses) {
      sum = sum + expense.amount;
    }

    return sum;
  }
}
