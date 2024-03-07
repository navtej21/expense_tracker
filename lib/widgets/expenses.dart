import 'dart:math';

import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/new_expenses.dart';
import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        context: context,
        builder: (context) => NewExpense(onAddExpense: _addExpense),
        isScrollControlled: true);
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });

    Navigator.pop(context);
  }

  void _removexpense(Expense expense) {
    final index = _registeredExpenses.indexOf(expense);

    // Store the removed expense and its index
    final removedExpense = _registeredExpenses.removeAt(index);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Deleted Successfully'),
      duration: Duration(seconds: 2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget maincontent = Center(
      child: Text('No Expenses Found Start Adding Somes'),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter ExpenseTracker',
          style: TextStyle(fontSize: 15),
        ),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpenses),
          _registeredExpenses.isEmpty
              ? maincontent
              : Expanded(
                  child: ExpensesList(
                      expenses: _registeredExpenses,
                      removexpense: _removexpense))
        ],
      ),
    );
  }
}
