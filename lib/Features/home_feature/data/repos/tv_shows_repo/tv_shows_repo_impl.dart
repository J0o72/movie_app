import 'package:dartz/dartz.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/Features/home_feature/data/repos/tv_shows_repo/tv_shows_repo.dart';
import 'package:movie_app/core/errors/failure.dart';

class TVShowsRepoImpl implements TVShowsRepo {
  @override
  Future<Either<Failure, List<MovieModel>>> fetchOnTheAirTVShows() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchPopularTVShows() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchTopRatingTVShows() {
    throw UnimplementedError();
  }
}
