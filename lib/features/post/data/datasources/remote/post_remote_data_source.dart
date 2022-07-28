import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:post_app/core/error/exceptions.dart';
import '../../models/post_model.dart';
import 'package:http/http.dart' as http;

const kBaseUrl = "http://student.devera.vn";

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPost();

  Future<Unit> addPost(PostModel postModel);

  Future<Unit> updatePost(PostModel postModel);

  Future<Unit> deletePost(PostModel postModel);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final http.Client client;

  PostRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PostModel>> getAllPost() async {
    final response = await client.get(Uri.parse("$kBaseUrl/post"),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;
      final List<PostModel> postModel =
          decodeJson.map((postJson) => PostModel.fromJson(postJson)).toList();
      return postModel;
    }
    throw ServerException();
  }

  @override
  Future<Unit> addPost(PostModel postModel) {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<Unit> deletePost(PostModel postModel) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<Unit> updatePost(PostModel postModel) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
