import 'package:protocolohttp/model/comment_model.dart';
import 'package:protocolohttp/repositories/comments/comments_repository_abstract.dart';
import 'package:protocolohttp/repositories/jsonplaceholder_custom_dio.dart';

class DioCommentsRepository implements CommentsRepository {
  @override
  Future<List<CommentModel>> getComments(int postId) async {
    var jsonCustomDio = JsonPlaceholderCustomDio();
    var response = await jsonCustomDio.baseUrl.get('/posts/$postId/comments');
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((comment) => CommentModel.fromJson(comment))
          .toList();
    }
    return [];
  }
}
