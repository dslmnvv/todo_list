import 'package:flutter/material.dart';

import '../style_library.dart';

class StyleTheme {
  var main = ThemeData(
      scaffoldBackgroundColor: StyleLibrary.color.backPrimary,
      textTheme: TextTheme(
          titleLarge: StyleLibrary.font.largeTitle,
          titleMedium: StyleLibrary.font.title, //button
          labelLarge: StyleLibrary.font.button,
          bodyMedium: StyleLibrary.font.body,
          headlineMedium: StyleLibrary.font.subhead //subhead
          ),
      iconTheme: IconThemeData(
        color: StyleLibrary.color.blue,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: StyleLibrary.color.backSecondary,
        backgroundColor: StyleLibrary.color.blue,
      ),
      checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return StyleLibrary.color.green;
            } else {
              return StyleLibrary.color.primary;
            }
          }),
          side: MaterialStateBorderSide.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return BorderSide.none;
            } else {
              return BorderSide(width: 2,color: StyleLibrary.color.separator);
            }
          }),
          overlayColor:
              MaterialStateProperty.all(StyleLibrary.color.separator)),
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: StyleLibrary.color.backPrimary,
          onPrimary: StyleLibrary.color.primary,
          secondary: StyleLibrary.color.backSecondary,
          onSecondary: StyleLibrary.color.secondary,
          error: StyleLibrary.color.secondary,
          onError: StyleLibrary.color.secondary,
          background: StyleLibrary.color.secondary,
          onBackground: StyleLibrary.color.secondary,
          surface: StyleLibrary.color.secondary,
          onSurface: StyleLibrary.color.secondary));

  var dark = ThemeData();
}
