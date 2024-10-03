import 'package:dartz/dartz.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/core/errors/failure.dart';

abstract class TVShowsRepo {
  Future<Either<Failure, List<MovieModel>>> fetchPopularTVShows();
  Future<Either<Failure, List<MovieModel>>> fetchOnTheAirTVShows();
  Future<Either<Failure, List<MovieModel>>> fetchTopRatingTVShows();
  Future<Either<Failure, List<MovieModel>>> fetchAiringTodayTVShows();
}
