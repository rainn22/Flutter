import 'package:flutter/material.dart';

import '../../models/expense.dart';
import 'expenses_form.dart';
import 'expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    // Expense(
    //   title: 'Flutter Course',
    //   amount: 19.99,
    //   date: DateTime.now(),
    //   category: Category.work,
    // ),
    // Expense(
    //   title: 'Cinema',
    //   amount: 15.69,
    //   date: DateTime.now(),
    //   category: Category.leisure,
    // ),
  ];

  // For handling Undo feature
  Expense? _lastRemovedExpense;
  int? _lastRemovedIndex;

  void onExpenseRemoved(Expense expense) {
    setState(() {
      _lastRemovedExpense = expense;
      _lastRemovedIndex = _registeredExpenses.indexOf(expense);
      _registeredExpenses.remove(expense); 
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              if (_lastRemovedExpense != null && _lastRemovedIndex != null) {
                _registeredExpenses.insert(_lastRemovedIndex!, _lastRemovedExpense!);
              }
            });
          },
        ),
        duration: const Duration(seconds: 3), 
      ),
    );
  }

  void onExpenseCreated(Expense newExpense) {
    setState(() {
      _registeredExpenses.add(newExpense);
    });
  }

  void onAddPressed() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => ExpenseForm(onCreated: onExpenseCreated),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: onAddPressed,
          )
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('My Expenses App'),
      ),
      body: _registeredExpenses.isEmpty
        ? const Center(
            child: Text(
              'No expenses found... Start adding some!',
              style: TextStyle(fontSize: 16),
            ),
          )
        : ExpensesList(
            expenses: _registeredExpenses, 
            onExpenseRemoved: onExpenseRemoved,
          ),
    );
  }
}
