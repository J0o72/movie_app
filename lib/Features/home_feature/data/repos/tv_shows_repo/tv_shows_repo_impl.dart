import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/Features/home_feature/data/models/genres_model/genres_model.dart';
import 'package:movie_app/Features/home_feature/data/models/tv_shows_model/tv_shows_model.dart';
import 'package:movie_app/Features/home_feature/data/repos/tv_shows_repo/tv_shows_repo.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/utils/api_service.dart';

class TVShowsRepoImpl implements TVShowsRepo {
  TVShowsRepoImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<Either<Failure, List<TvShowsModel>>> fetchOnTheAirTVShows() async {
    try {
      var data =
          await apiService.get(endPoint: 'tv/on_the_air?language=en-US&page=1');

      List<TvShowsModel> onTheAirTVShows = [];
      for (var item in data['results']) {
        onTheAirTVShows.add(TvShowsModel.fromJson(item));
      }
      return right(onTheAirTVShows);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<TvShowsModel>>> fetchPopularTVShows() async {
    try {
      var data =
          await apiService.get(endPoint: 'tv/popular?language=en-US&page=1');

      List<TvShowsModel> popularTVShows = [];
      for (var item in data['results']) {
        popularTVShows.add(TvShowsModel.fromJson(item));
      }
      return right(popularTVShows);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<TvShowsModel>>> fetchTopRatingTVShows() async {
    try {
      var data =
          await apiService.get(endPoint: 'tv/top_rated?language=en-US&page=1');

      List<TvShowsModel> topRatingTVShows = [];
      for (var item in data['results']) {
        topRatingTVShows.add(TvShowsModel.fromJson(item));
      }
      return right(topRatingTVShows);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<TvShowsModel>>> fetchAiringTodayTVShows() async {
    try {
      var data = await apiService.get(
          endPoint: 'tv/airing_today?language=en-US&page=1');

      List<TvShowsModel> airingTodayTVShows = [];
      for (var item in data['results']) {
        airingTodayTVShows.add(TvShowsModel.fromJson(item));
      }
      return right(airingTodayTVShows);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<GenresModel>>> fetchGenresTVShows() async {
    try {
      var data = await apiService.get(endPoint: 'genre/tv/list?language=en');

      List<GenresModel> genreTvShows = [];
      for (var item in data['genres']) {
        genreTvShows.add(GenresModel.fromJson(item));
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
}
