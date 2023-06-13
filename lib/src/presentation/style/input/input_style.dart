import 'package:flutter/material.dart';
import 'package:todo_list/src/presentation/style/style_library.dart';

class InputStyle {
  var main = InputDecoration(
    filled: true,
    focusedBorder: StyleLibrary.border.main,
    border: StyleLibrary.border.main,
    enabledBorder: StyleLibrary.border.main,
  );
}
