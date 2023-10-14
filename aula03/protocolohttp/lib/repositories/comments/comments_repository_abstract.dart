import 'package:protocolohttp/model/comment_model.dart';

abstract class CommentsRepository {
  Future<List<CommentModel>> getComments(int postId);
}
