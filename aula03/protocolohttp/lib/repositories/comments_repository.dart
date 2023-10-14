import 'dart:convert';
import 'package:protocolohttp/model/comment_model.dart';
import 'package:http/http.dart' as http;

class CommentsRepository {
  Future<List<CommentModel>> getComments(int postId) async {
    var response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/posts/$postId/comments'));
    if (response.statusCode == 200) {
      var jsonComments = jsonDecode(response.body);
      return (jsonComments as List)
          .map((comment) => CommentModel.fromJson(comment))
          .toList();
    }
    return [];
  }
}
