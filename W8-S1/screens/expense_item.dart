import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/expense.dart';

class ExpenseItem extends StatelessWidget {
  final Expense expense;

  const ExpenseItem({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    // Format the date using intl package
    final formattedDate = DateFormat.yMd().format(expense.date);

    // Get the icon
    IconData expenseIcon;
    switch (expense.type) {
      case ExpenseType.food:
        expenseIcon = Icons.food_bank_sharp;
        break;
      case ExpenseType.leisure:
        expenseIcon = Icons.book;
        break;
      default:
        expenseIcon = Icons.attach_money;
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expense.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "\$${expense.amount.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const Spacer(),

            Row(
              children: [
                Icon(expenseIcon, color: Colors.blue),
                const SizedBox(width: 10),
                Text(
                  formattedDate,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
