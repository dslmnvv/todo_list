import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/src/presentation/providers/home_provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:todo_list/src/presentation/to_do_llist_app.dart';
import 'package:todo_list/src/setup_service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupServiceLocator();
  initializeDateFormatting();

  await GetIt.instance.allReady();
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: const TodoListApp(),
      ),
  );
}



