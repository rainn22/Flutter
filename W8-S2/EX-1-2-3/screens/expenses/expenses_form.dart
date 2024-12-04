import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  Category? _selectedCategory;
  DateTime? _selectedDate;

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void onCancel() {
    Navigator.pop(context); // Close modal
  }

  void onAdd() {
    if (_selectedCategory == null || _selectedDate == null) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Invalid Input'),
        content: const Text('Please select a category and date!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: const Text('Okay'),
          ),
        ],
      ),
    );
    return;
  }

    // 1- Get the values from inputs
    String title = _titleController.text;
    double amount = double.parse(_valueController.text);

    // 2- Create the expense
    Expense expense = Expense(
      title: title,
      amount: amount,
      date: _selectedDate!, 
      category: _selectedCategory!, 
    );

    // 3- Ask the parent to add the expense
    widget.onCreated(expense);

    // 4- Close modal
    Navigator.pop(context);
  }

  Future<void> _presentDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormat.yMMMd();
    
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            controller: _valueController,
            maxLength: 50,
            decoration: const InputDecoration(
              prefix: Text('\$ '),
              label: Text('Amount'),
            ),
          ),
          DropdownButton<Category>(
            value: _selectedCategory,
            hint: const Text('Select Category'),
            isExpanded: true,
            items: Category.values
                .map(
                  (cat) => DropdownMenuItem<Category>(
                    value: cat,
                    child: Text(cat.name.toUpperCase()),
                  ),
                )
                .toList(),
            onChanged: (Category? newCategory) {
              setState(() {
                _selectedCategory = newCategory;
              });
            },
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  _selectedDate == null
                      ? 'No date selected'
                      : 'Date: ${dateFormatter.format(_selectedDate!)}',
                )
              ),
              IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: _presentDatePicker,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: onCancel, child: const Text('Cancel')),
              const SizedBox(width: 20),
              ElevatedButton(onPressed: onAdd, child: const Text('Save Expense')),
            ],
          )
        ],
      ),
    );
  }
}
