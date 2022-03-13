import 'dart:convert';

import 'package:http/http.dart' as http;

class DataForPost {
  static final DataForPost _instance = DataForPost._privado();

  DataForPost._privado();

  factory DataForPost() {
    return _instance;
  }

  Future<List<Map<String, dynamic>>> get dataForPost async {
    List<Map<String, dynamic>> dataForPost = [];

    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/posts/"));

    List<dynamic> data = json.decode(response.body);

    data.forEach((element) {
      dataForPost.add(element);
    });

    return dataForPost;
  }
}
