import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/src/presentation/providers/home_provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:todo_list/src/presentation/to_do_llist_app.dart';

void main() {
  initializeDateFormatting();
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: const TodoListApp(),
      ),
  );
}



