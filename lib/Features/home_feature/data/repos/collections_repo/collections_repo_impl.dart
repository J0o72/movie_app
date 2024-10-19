import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/Features/home_feature/data/models/actor_model/actor_known_for.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/Features/home_feature/data/models/tv_shows_model/tv_shows_model.dart';
import 'package:movie_app/Features/home_feature/data/repos/collections_repo/collections_repo.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/utils/api_service.dart';

class CollectionsRepoImpl implements CollectionsRepo {
  final ApiService apiService;

  CollectionsRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<MovieModel>>> fetchCollectionsOf(
      {required String collectionOf}) async {
    try {
      List<MovieModel> collection = [];
      for (int i = 1; i <= 5; i++) {
        var data = await apiService.get(
            endPoint: 'movie/$collectionOf?language=en-US&page=$i');

        for (var item in data['results']) {
          collection.add(MovieModel.fromJson(item));
        }
      }

      return right(collection);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<TvShowsModel>>> fetchTvShowsCollectionsOf(
      {required String collectionOf}) async {
    try {
      List<TvShowsModel> collection = [];
      for (int i = 1; i <= 5; i++) {
        var data = await apiService.get(
            endPoint: 'tv/$collectionOf?language=en-US&page=$i');

        for (var item in data['results']) {
          collection.add(TvShowsModel.fromJson(item));
        }
      }

      return right(collection);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>>
      fetchComingSoonMoviesCollection() async {
    try {
      List<MovieModel> collection = [];
      for (int i = 1; i <= 10; i++) {
        var data = await apiService.get(
          endPoint:
              'discover/movie?include_adult=false&include_video=false&language=en-US&page=$i&primary_release_date.gte=2025-01-01&sort_by=popularity.desc&with_genres=28%7C12%7C878%7C53',
        );

        for (var item in data['results']) {
          collection.add(MovieModel.fromJson(item));
        }
      }

      return right(collection);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchSpecificGenreMovies(
      {required String genreId}) async {
    try {
      List<MovieModel> genreMovies = [];
      for (int i = 1; i <= 10; i++) {
        var data = await apiService.get(
            endPoint:
                'discover/movie?include_adult=false&include_video=false&language=en-US&sort_by=popularity.desc&with_genres=$genreId&page=$i');

        for (var item in data['results']) {
          genreMovies.add(MovieModel.fromJson(item));
        }
      }

      return right(genreMovies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<TvShowsModel>>> fetchSpecificGenreTvShows(
      {required String genreId}) async {
    try {
      List<TvShowsModel> genreTvShows = [];
      for (int i = 1; i <= 10; i++) {
        var data = await apiService.get(
            endPoint:
                'discover/tv?include_adult=false&include_null_first_air_dates=false&language=en-US&page=$i&sort_by=popularity.desc&with_genres=$genreId');

        for (var item in data['results']) {
          genreTvShows.add(TvShowsModel.fromJson(item));
        }
      }

      return right(genreTvShows);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchMovieMoreLikeThis(
      {required int id}) async {
    try {
      List<MovieModel> movieMoreLikeThis = [];
      for (int i = 1; i <= 10; i++) {
        var data = await apiService.get(
            endPoint: 'movie/$id/similar?language=en-US&page=$i');

        for (var item in data['results']) {
          movieMoreLikeThis.add(MovieModel.fromJson(item));
        }
      }

      return right(movieMoreLikeThis);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<TvShowsModel>>> fetchTvMoreLikeThis(
      {required String id}) async {
    try {
      List<TvShowsModel> tvMoreLikeThis = [];
      for (int i = 1; i <= 10; i++) {
        var data = await apiService.get(
            endPoint: 'tv/$id/similar?language=en-US&page=$i');

        for (var item in data['results']) {
          tvMoreLikeThis.add(TvShowsModel.fromJson(item));
        }
      }

      return right(tvMoreLikeThis);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ActorKnownFor>>> fetchActorCredits(
      {required String actorID}) async {
    try {
      List<ActorKnownFor> actorCredits = [];

      var data = await apiService.get(
          endPoint: 'person/$actorID/combined_credits?language=en-US');

      for (var item in data['cast']) {
        actorCredits.add(ActorKnownFor.fromJson(item));
      }

      return right(actorCredits);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<TvShowsModel>>> fetchPopularTvCollection() async {
    try {
      List<TvShowsModel> popularTvShows = [];
      for (int i = 1; i <= 10; i++) {
        var data = await apiService.get(
            endPoint:
                'discover/tv?first_air_date.gte=2024-01-01&include_adult=false&include_null_first_air_dates=false&language=en-US&page=$i&sort_by=popularity.desc&without_genres=37%7C10763%7C10762%7C10766%7C10767%7C10751%7C35');

        for (var item in data['results']) {
          popularTvShows.add(TvShowsModel.fromJson(item));
        }
      }

      return right(popularTvShows);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
