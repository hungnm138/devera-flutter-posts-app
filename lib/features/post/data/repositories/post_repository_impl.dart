import 'package:dartz/dartz.dart';
import 'package:post_app/core/error/exceptions.dart';
import 'package:post_app/core/error/failure.dart';
import 'package:post_app/core/network/network_info.dart';
import 'package:post_app/features/post/data/datasources/local/post_local_data_source.dart';
import 'package:post_app/features/post/data/datasources/remote/post_remote_data_source.dart';
import 'package:post_app/features/post/data/models/post_model.dart';
import 'package:post_app/features/post/domain/entities/post.dart';
import 'package:post_app/features/post/domain/repositories/post_repositories.dart';

typedef DeleteOrUpdateOrAddPost = Future<Unit> Function();

class PostsRepositoryImpl implements PostsRepository {
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PostsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    if (await networkInfo.isConnected) {
      ///Get data from network if network is connected
      try {
        final remotePost = await remoteDataSource.getAllPost();
        localDataSource.cachePost(remotePost);
        return Right(remotePost);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      ///Get data from local
      try {
        final localPosts = await localDataSource.getCachedPost();
        return Right(localPosts);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addPost(PostModel postModel) {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deletePost(PostModel postModel) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updatePost(PostModel postModel) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
