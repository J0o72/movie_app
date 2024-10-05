import 'package:dartz/dartz.dart';
import 'package:movie_app/Features/home_feature/data/models/genres_model/genres_model.dart';
import 'package:movie_app/Features/home_feature/data/models/tv_shows_model/tv_shows_model.dart';
import 'package:movie_app/core/errors/failure.dart';

abstract class TVShowsRepo {
  Future<Either<Failure, List<TvShowsModel>>> fetchPopularTVShows();
  Future<Either<Failure, List<TvShowsModel>>> fetchOnTheAirTVShows();
  Future<Either<Failure, List<TvShowsModel>>> fetchTopRatingTVShows();
  Future<Either<Failure, List<TvShowsModel>>> fetchAiringTodayTVShows();
  Future<Either<Failure, List<GenresModel>>> fetchGenresTVShows();
}
