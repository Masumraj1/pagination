import "package:http/http.dart" as http;
import 'dart:convert';

import 'package:pagination/post_model.dart';

class PostRepository {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<PostModel>> fetchPosts(int page, int limit) async {
    final response = await http.get(Uri.parse('$_baseUrl?_page=$page&_limit=$limit'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => PostModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

}