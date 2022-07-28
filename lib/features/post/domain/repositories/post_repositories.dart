import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/post_model.dart';
import '../entities/post.dart';

abstract class PostsRepository {
  Future<Either<Failure, List<Post>>> getAllPosts();

  Future<Either<Failure, Unit>> addPost(PostModel postModel);

  Future<Either<Failure, Unit>> updatePost(PostModel postModel);

  Future<Either<Failure, Unit>> deletePost(PostModel postModel);
}
