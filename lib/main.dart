import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';

var KcolorSchema =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 91, 59, 181));

var Kdarkcolorschema = ColorScheme.fromSeed(
    seedColor: Color.fromARGB(255, 30, 99, 125), brightness: Brightness.dark);
void main() {
  runApp(
    MaterialApp(
        darkTheme: ThemeData.dark(useMaterial3: true)
            .copyWith(colorScheme: Kdarkcolorschema),
        theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: KcolorSchema,
          appBarTheme: AppBarTheme().copyWith(
              backgroundColor: KcolorSchema.onPrimaryContainer,
              foregroundColor: KcolorSchema.primaryContainer),
          cardTheme: CardTheme(
              color: KcolorSchema.secondaryContainer,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
        ),
        themeMode: ThemeMode.light,
        home: const Expenses(),
        debugShowCheckedModeBanner: false),
  );
}
