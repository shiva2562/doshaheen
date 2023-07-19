class UserTaskModel {
  final int id;
  final int userId;
  final String title;
  final bool isCompleted;

  UserTaskModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userId = json['userId'],
        title = json['title'],
        isCompleted = json['completed'];
}
