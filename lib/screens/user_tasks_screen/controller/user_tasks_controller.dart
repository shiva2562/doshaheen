import 'package:doshaheen/screens/user_tasks_screen/models/user_task_model.dart';
import 'package:get/get.dart';

import '../services/user_json_service.dart';

class UserTaskController extends GetxController {
  final UserJsonServices userJsonServices = UserJsonServices();
  List<UserTaskModel> tasks = [];
  List<UserTaskModel> selectedTasks = [];
  List<int> users = [];
  int currentUserId = 1;
  int total = 0;
  int pending = 0;
  bool loading = true;
  @override
  void onInit() async {
    tasks = await userJsonServices.readJson().then(
          (value) => value.map((e) => UserTaskModel.fromJson(e)).toList(),
        );
    getAllUsers();
    filterTasks();
    loading = false;
    update();
    super.onInit();
  }

  void getAllUsers() {
    for (var task in tasks) {
      if (!users.contains(task.userId)) {
        users.add(task.userId);
      }
    }
  }

  void filterTasks() {
    total = 0;
    pending = 0;
    selectedTasks = [];
    for (var task in tasks) {
      if (task.userId == currentUserId) {
        selectedTasks.add(task);
        total += 1;
        if (!task.isCompleted) {
          pending += 1;
        }
      }
    }
    update();
  }
}
