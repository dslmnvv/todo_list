import 'package:flutter/material.dart';
import 'package:todo_list/src/presentation/style/style_library.dart';
import 'package:todo_list/src/routing/navigation_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../_common/l10n/s.dart';

class TodoListApp extends StatelessWidget {
  const TodoListApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      routerDelegate: NavigationService.routerDelegate,
      routeInformationParser: NavigationService.routeInformationParser,
      supportedLocales: S.all,
      //  navigatorKey: NavigationService.navigatorKey,
      theme: StyleLibrary.theme.main,
      darkTheme: StyleLibrary.theme.dark,
      debugShowCheckedModeBanner: false,
      title: 'To-Do list',
      //onGenerateRoute: NavigationService.onGenerateRoute,
      //initialRoute: HomePage.routeName,
    );
  }
}
