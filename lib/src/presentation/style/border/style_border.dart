import 'package:flutter/material.dart';

class StyleBorder{

  var main = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.transparent,
        style: BorderStyle.solid,
      )
  );

}