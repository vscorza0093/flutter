import 'package:protocolohttp/model/post_model.dart';

abstract class PostRepository {
  Future<List<PostModel>> getPosts();
}
