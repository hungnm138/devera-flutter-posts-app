import '../../../domain/entities/post.dart';
import 'update_post_btn_widget.dart';
import 'package:flutter/material.dart';

import 'delete_post_btn_widget.dart';

class PostsDetailWidget extends StatelessWidget {
  final Post post;
  const PostsDetailWidget({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            post.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divider(height: 50),
          Text(
            post.body,
            style: const TextStyle(fontSize: 16),
          ),
          const Divider(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UpdatePostWidget(post: post),
              DeletePostWidget(postId: post.id!),
            ],
          )
        ],
      ),
    );
  }
}
