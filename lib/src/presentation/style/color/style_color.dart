import 'package:flutter/material.dart';

class StyleColor {
  final main = MainKitColor();
  final dark = DarkKitColor();
}

class MainKitColor{
  final separator = const Color.fromRGBO(0, 0, 0, 0.2);
  final overlay = const Color.fromRGBO(0, 0, 0, 0.06);

  final primary = const Color.fromRGBO(0, 0, 0, 1);
  final secondary = const Color.fromRGBO(0, 0, 0, 0.6);
  final tertiary = const Color.fromRGBO(0, 0, 0, 0.3);
  final disable = const Color.fromRGBO(0, 0, 0, 0.15);

  final red = const Color.fromRGBO(255, 59, 48, 1);
  final green = const Color.fromRGBO(52, 199, 89, 1);
  final blue = const Color.fromRGBO(0, 122, 255, 1);
  final gray = const Color.fromRGBO(142, 142, 147, 1);
  final grayLight = const Color.fromRGBO(209, 209, 214, 1);

  final backPrimary = const Color.fromRGBO(247, 246, 242, 1);
  final backSecondary = const Color.fromRGBO(255, 255, 255, 1);
  final backLight = const Color.fromRGBO(255, 255, 255, 1);
}

class DarkKitColor{
  final separator = const Color.fromRGBO(255, 255, 255, 0.2);
  final overlay = const Color.fromRGBO(0, 0, 0, 0.32);

  final primary = const Color.fromRGBO(255, 255, 255, 1);
  final secondary = const Color.fromRGBO(255, 255, 255, 0.6);
  final tertiary = const Color.fromRGBO(255, 255, 255, 0.4);
  final disable = const Color.fromRGBO(255, 255, 255, 0.15);

  final red = const Color.fromRGBO(255, 69, 58, 1);
  final green = const Color.fromRGBO(52, 215, 75, 1);
  final blue = const Color.fromRGBO(10, 132, 255, 1);
  final gray = const Color.fromRGBO(142, 142, 147, 1);
  final grayLight = const Color.fromRGBO(72, 72, 74, 1);

  final backPrimary = const Color.fromRGBO(22, 22, 24, 1);
  final backSecondary = const Color.fromRGBO(37, 37, 40, 1);
  final backLight = const Color.fromRGBO(60, 60, 63, 1);
}
