import 'package:protocolohttp/model/post_model.dart';
import 'package:protocolohttp/repositories/jsonplaceholder_custom_dio.dart';
import 'package:protocolohttp/repositories/posts/posts_repository_abstract.dart';

class DioPostRepository implements PostRepository {
  @override
  Future<List<PostModel>> getPosts() async {
    JsonPlaceholderCustomDio jsonPlaceholder = JsonPlaceholderCustomDio();
    var response = await jsonPlaceholder.baseUrl.get('/posts');
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((post) => PostModel.fromJson(post))
          .toList();
    }
    return [];
  }
}
