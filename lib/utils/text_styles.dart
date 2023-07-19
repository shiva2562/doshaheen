import 'package:doshaheen/enums/text_style_enums.dart';
import 'package:flutter/material.dart';

extension CustomTextStyles on CustomTextColors {
  TextStyle getTextStyle() {
    switch (this) {
      case CustomTextColors.red:
        return const TextStyle(color: Colors.red, fontWeight: FontWeight.bold);
      case CustomTextColors.green:
        return const TextStyle(
            color: Colors.green, fontWeight: FontWeight.bold);
      case CustomTextColors.blue:
        return const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold);
      case CustomTextColors.redSmall:
        return const TextStyle(color: Colors.red);
      case CustomTextColors.greenSmall:
        return const TextStyle(color: Colors.green);
    }
  }
}
