import 'package:doshaheen/enums/text_style_enums.dart';
import 'package:doshaheen/utils/text_styles.dart';
import 'package:flutter/material.dart';

Widget getTaskOverview({required int total, required int pending}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Total Tasks: $total",
        style: CustomTextColors.blue.getTextStyle(),
      ),
      Text("Completed Tasks: ${total - pending}",
          style: CustomTextColors.green.getTextStyle()),
      Text("Pending Tasks: $pending",
          style: CustomTextColors.red.getTextStyle()),
    ],
  );
}
