import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

/* Data class for capturing Expense related data points */

final uuid = const Uuid();

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

  var dateFormat = DateFormat.yMMM();
  String get formattedDate => dateFormat.format(date);
}
