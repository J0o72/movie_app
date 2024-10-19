import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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
          endPoint:
              'discover/tv?first_air_date.gte=2024-01-01&include_adult=false&include_null_first_air_dates=false&language=en-US&page=1&sort_by=popularity.desc&without_genres=37%7C10763%7C10762%7C10766%7C10767%7C10751%7C35');

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
}
