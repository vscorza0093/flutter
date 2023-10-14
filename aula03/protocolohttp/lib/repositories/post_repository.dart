import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:protocolohttp/model/post_model.dart';

class PostRepository {
  Future<List<PostModel>> getPosts() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      var jsonPost = jsonDecode(response.body);
      var postList =
          (jsonPost as List).map((post) => PostModel.fromJson(post)).toList();
      return postList;
    }
    return [];
  }
}
