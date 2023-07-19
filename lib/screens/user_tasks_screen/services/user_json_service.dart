import 'dart:convert';

import 'package:flutter/services.dart';

class UserJsonServices {
  Future<List<dynamic>> readJson() async {
    final String response = await rootBundle.loadString('assets/todos.json');
    final data = await json.decode(response) as List;
    return data;
  }
}
