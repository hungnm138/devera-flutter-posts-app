import 'package:flutter/material.dart';

import '../widgets/loading_widget.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() => AppBar(
        title: const Text('Posts'),
        centerTitle: true,
      );

  _buildBody() {
    return const Padding(
      padding: EdgeInsets.all(10),
      child: LoadingWidget(),
    );
  }
}
