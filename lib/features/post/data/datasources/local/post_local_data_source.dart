import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:post_app/core/error/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/post_model.dart';

const kCachedPosts = "CACHED_POSTS";

abstract class PostLocalDataSource {
  Future<List<PostModel>> getCachedPost();

  Future<Unit> cachePost(List<PostModel> postModel);
}

class PostLocalDataSourceImpl implements PostLocalDataSource {
  final SharedPreferences sharedPreferences;

  PostLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> cachePost(List<PostModel> postModel) {
    List postModelToJson = postModel.map((post) => post.toJson()).toList();
    sharedPreferences.setString(kCachedPosts, json.encode(postModelToJson));
    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getCachedPost() {
    final jsonString = sharedPreferences.getString(kCachedPosts);

    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      final List<PostModel> jsonToPostModels = decodeJsonData
          .map((postJson) => PostModel.fromJson(postJson))
          .toList();
      return Future.value(jsonToPostModels);
    }
    return throw EmptyCacheException();
  }
}
