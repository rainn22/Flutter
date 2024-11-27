import '../models/expense.dart';
import 'expense_list.dart';
import 'package:flutter/material.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final List<Expense> expensesList = [
    Expense(
      title: "book",
      type: ExpenseType.leisure,
      amount: 12,
      date: DateTime.now(),
    ),
    Expense(
      title: "milk",
      type: ExpenseType.food,
      amount: 1.5,
      date: DateTime.now(),
    ),
    Expense(
      title: "lock lack",
      type: ExpenseType.food,
      amount: 2,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: const Text('Expenses App'),
        actions: [
          IconButton(
            onPressed: onAddClick, // Pass the function reference
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ExpenseList(expenses: expensesList),
    );
  }

  void onAddClick() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Container(
        height: 350,
        padding: const EdgeInsets.all(15),
        child: const Center(
          child: Text("Add Expense Modal"),
        ),
      ),
    );
  }
}
