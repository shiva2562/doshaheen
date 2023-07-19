import 'package:doshaheen/enums/text_style_enums.dart';
import 'package:doshaheen/utils/text_styles.dart';
import 'package:flutter/material.dart';

import '../models/user_task_model.dart';

Widget getTaskListView(List<UserTaskModel> taskList) {
  return Expanded(
      child: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (context, current) {
            return Container(
              color: current % 2 == 0 ? Colors.white : Colors.black12,
              child: ListTile(
                title: Text(taskList[current].title),
                trailing: taskList[current].isCompleted
                    ? Text(
                        "Completed",
                        style: CustomTextColors.greenSmall.getTextStyle(),
                      )
                    : Text("Pending",
                        style: CustomTextColors.redSmall.getTextStyle()),
              ),
            );
          }));
}
