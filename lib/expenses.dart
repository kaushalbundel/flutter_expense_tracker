import 'package:flutter/material.dart';

/*
The objective of this widget is to  capture all the related widgets from where:

1. The graphical representation of the expenses can be documented
2. Expenses can be added
3. Expenses can be shown in a list view
4. Expenses can be deleted
*/

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Expenses"),
          backgroundColor: Colors.blue,
        ),
        body: const Center(
          child: Column(
            children: [
              Text("Graph Widget space"),
              SizedBox(height: 20),
              Text("List View space"),
            ],
          ),
        ),
      ),
    );
  }
}
