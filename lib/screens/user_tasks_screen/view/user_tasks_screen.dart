import 'package:doshaheen/screens/user_tasks_screen/controller/user_tasks_controller.dart';
import 'package:doshaheen/screens/user_tasks_screen/widgets/task_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/routes.dart';
import '../widgets/tasks_overview.dart';

class UserTasksScreen extends GetView<UserTaskController> {
  const UserTasksScreen({super.key});
  static const route = Routes.userTaskScreen;
  static GetPage page = GetPage(
      name: UserTasksScreen.route,
      page: UserTasksScreen.new,
      binding: BindingsBuilder.put(() => UserTaskController()));

  Widget getUserDropDown() {
    return Center(
      child: DropdownButton<int>(
        value: controller.currentUserId,
        elevation: 0,
        onChanged: (int? newValue) {
          controller.currentUserId = newValue ?? 1;
          controller.filterTasks();
        },
        items: controller.users
            .map((e) => DropdownMenuItem<int>(
                  value: e,
                  child: Text('user $e'),
                ))
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tasks'),
        ),
        body: GetBuilder(
            init: controller,
            builder: (_) {
              if (controller.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getUserDropDown(),
                    const SizedBox(
                      height: 20,
                    ),
                    getTaskOverview(
                        total: controller.total, pending: controller.pending),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Tasks',
                      style: TextStyle(fontSize: 30),
                    ),
                    getTaskListView(controller.selectedTasks)
                  ],
                ),
              );
            }));
  }
}
