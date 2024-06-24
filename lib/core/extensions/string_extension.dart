
import 'package:flutter/material.dart';

extension Strings on String {

  String prependCurrency() {
    return "৳${double.parse(this).toStringAsFixed(2)}";
  }

  Color toColor(){
    String code = replaceAll('#', 'FF');
    return Color(int.parse("0x$code"));
  }

}
