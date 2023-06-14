import 'package:flutter/material.dart';
import 'package:todo_list/src/presentation/pages/home_page.dart';
import 'package:todo_list/src/presentation/style/style_library.dart';
import 'package:todo_list/src/routing/navigation_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class TodoListApp extends StatelessWidget {
  const TodoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ru')
      ],
      navigatorKey: NavigationService.navigatorKey,
      theme: StyleLibrary.theme.main,
      darkTheme: StyleLibrary.theme.main, //todo: изменить тему
      debugShowCheckedModeBanner: false,
      title: 'To-Do list',
      onGenerateRoute: NavigationService.onGenerateRoute,
      initialRoute: HomePage.routeName,
    );
  }
}
