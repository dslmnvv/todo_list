import 'package:flutter/material.dart';
import 'package:todo_list/src/presentation/style/border/style_border.dart';
import 'package:todo_list/src/presentation/style/color/style_color.dart';
import 'package:todo_list/src/presentation/style/font/style_font.dart';
import 'package:todo_list/src/presentation/style/format/style_format.dart';
import 'package:todo_list/src/presentation/style/input/input_style.dart';
import 'package:todo_list/src/presentation/style/padding/stylle_padding.dart';
import 'package:todo_list/src/presentation/style/theme/style_theme.dart';

class StyleLibrary {
  static var theme = StyleTheme();
  static var font = StyleFont();
  static var padding = StylePadding();
  static var color = StyleColor();
  static var input = InputStyle();
  static var border = StyleBorder();
  static var format = StyleFormat();
}
