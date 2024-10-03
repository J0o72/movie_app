import 'package:dartz/dartz.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/Features/home_feature/data/repos/movie_repo/movie_repo.dart';
import 'package:movie_app/core/errors/failure.dart';

class MovieRepoImpl implements MovieRepo {
  @override
  Future<Either<Failure, List<MovieModel>>> fetchComingSoonMovies() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchNowPlayingMovies() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchPopularMovies() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchTopRatingMovies() {
    throw UnimplementedError();
  }
}
