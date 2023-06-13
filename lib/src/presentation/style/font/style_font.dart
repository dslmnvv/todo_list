import 'package:flutter/material.dart';
import 'package:todo_list/src/presentation/style/style_library.dart';

class StyleFont{

  var largeTitle = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: 32,
    color: StyleLibrary.color.primary,
  );
  var title = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: 20,
    letterSpacing: 0.5,
    color: StyleLibrary.color.primary,
  );

  var button = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: 14,
    letterSpacing: 0.16,
    color: StyleLibrary.color.primary,
  );

  var body =  TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: StyleLibrary.color.primary,
  );

  var subhead =  TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: StyleLibrary.color.primary,
  );


}