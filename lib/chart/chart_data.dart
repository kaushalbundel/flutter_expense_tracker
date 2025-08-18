/* The widget converts the data stored in the application into data that can be an input to the charting library*/

import 'package:expense_tracker/models/expense.dart';

class ChartData {
  ChartData(this.expenses);

  final List<DataExpense> expenses;

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, Category.client),
      ExpenseBucket.forCategory(expenses, Category.home),
      ExpenseBucket.forCategory(expenses, Category.personal),
      ExpenseBucket.forCategory(expenses, Category.vehicle),
    ];
  }

  // for scaling the chart max category sum is needed
  double get maxTotalExpense {
    double maxTotalExpense = 0;
    for (final bucket in buckets) {
      if (bucket.totalExpense >= maxTotalExpense) {
        maxTotalExpense = bucket.totalExpense;
      }
    }
    return maxTotalExpense;
  }
}
