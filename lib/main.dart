import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

// setting the primary color of the color colorScheme

var kcolorScheme = ColorScheme.fromSeed(seedColor: Colors.white10);
// what does it mean to add the color from seed vs normal color adding which is fromswatch
// What is the most commonly used way of adding colors
// Does themeing with the Theme() constructor needs the entire thing (all the parameters that should be set) to be added

void main() {
  runApp(
    MaterialApp(
      home: const Expenses(),
      theme: ThemeData().copyWith(
        colorScheme: kcolorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: kcolorScheme.primary,
          foregroundColor: kcolorScheme.onPrimary,
        ),
      ),
    ),
  );
}
