import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protocolohttp/model/post_model.dart';
import 'package:protocolohttp/pages/comments_page.dart';
import 'package:protocolohttp/repositories/posts/dio/dio_post_repository.dart';
// import 'package:protocolohttp/repositories/posts/http/http_post_repository.dart';
import 'package:protocolohttp/repositories/posts/posts_repository_abstract.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  PostRepository postRepository = DioPostRepository();
  List<PostModel> postList = <PostModel>[];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    postList = await postRepository.getPosts();
    setState(() {});
  }

  void openComment(int postId) => Navigator.push(
      context, MaterialPageRoute(builder: (_) => CommentsPage(postId: postId)));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Publicações'),
        ),
        body: ListView.builder(
          itemCount: postList.length,
          itemBuilder: (_, index) {
            var post = postList[index];
            return InkWell(
              onTap: () {
                openComment(post.id);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Card(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Card Title
                        Text(
                          post.title,
                          style: GoogleFonts.roboto(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        // Card Body
                        Text(
                          post.body,
                          style: GoogleFonts.roboto(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
