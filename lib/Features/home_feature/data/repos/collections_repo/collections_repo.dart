import 'package:dartz/dartz.dart';
import 'package:movie_app/Features/home_feature/data/models/actor_model/actor_known_for.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/Features/home_feature/data/models/tv_shows_model/tv_shows_model.dart';
import 'package:movie_app/core/errors/failure.dart';

abstract class CollectionsRepo {
  Future<Either<Failure, List<MovieModel>>> fetchCollectionsOf(
      {required String collectionOf});
  Future<Either<Failure, List<MovieModel>>> fetchComingSoonMoviesCollection();
  Future<Either<Failure, List<TvShowsModel>>> fetchPopularTvCollection();

  Future<Either<Failure, List<TvShowsModel>>> fetchTvShowsCollectionsOf(
      {required String collectionOf});
  Future<Either<Failure, List<MovieModel>>> fetchSpecificGenreMovies(
      {required String genreId});
  Future<Either<Failure, List<TvShowsModel>>> fetchSpecificGenreTvShows(
      {required String genreId});
  Future<Either<Failure, List<MovieModel>>> fetchMovieMoreLikeThis(
      {required int id});
  Future<Either<Failure, List<TvShowsModel>>> fetchTvMoreLikeThis(
      {required String id});
  Future<Either<Failure, List<ActorKnownFor>>> fetchActorCredits(
      {required String actorID});
}
