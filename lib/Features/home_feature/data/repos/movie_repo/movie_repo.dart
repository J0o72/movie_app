import 'package:dartz/dartz.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/core/errors/failure.dart';

abstract class MovieRepo {
  Future<Either<Failure, List<MovieModel>>> fetchPopularMovies();
  Future<Either<Failure, List<MovieModel>>> fetchNowPlayingMovies();
  Future<Either<Failure, List<MovieModel>>> fetchTopRatingMovies();
  Future<Either<Failure, List<MovieModel>>> fetchComingSoonMovies();
}
