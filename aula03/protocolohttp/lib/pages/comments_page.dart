import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protocolohttp/model/comment_model.dart';
import 'package:protocolohttp/repositories/comments/comments_repository_abstract.dart';
import 'package:protocolohttp/repositories/comments/dio/dio_comments_repository.dart';
// import 'package:protocolohttp/repositories/comments/http/http_comments_repository.dart';

class CommentsPage extends StatefulWidget {
  final int postId;
  const CommentsPage({super.key, required this.postId});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  CommentsRepository commentsRepository = DioCommentsRepository();
  List<CommentModel> commentsList = <CommentModel>[];

  @override
  void initState() {
    super.initState();
    loadComments();
  }

  void loadComments() async {
    commentsList = await commentsRepository.getComments(widget.postId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Comentários do Post: ${widget.postId}'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: ListView.builder(
          itemCount: commentsList.length,
          itemBuilder: (_, int index) {
            var comment = commentsList[index];
            return Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name: ${comment.name}'),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      'Mail: ${comment.email}',
                      style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text('Comment: \n${comment.body}'),
                    const SizedBox(
                      height: 28,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}
