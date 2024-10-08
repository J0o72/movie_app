import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/Features/home_feature/data/repos/movie_repo/movie_repo.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/utils/api_service.dart';

class MovieRepoImpl implements MovieRepo {
  MovieRepoImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<Either<Failure, List<MovieModel>>> fetchComingSoonMovies() async {
    try {
      var data = await apiService.get(
          endPoint:
              'discover/movie?include_adult=false&include_video=false&language=en-US&page=1&primary_release_date.gte=2025-01-01&sort_by=popularity.desc&with_genres=28%7C12%7C878%7C53');

      List<MovieModel> comingSoonMovies = [];
      for (var item in data['results']) {
        comingSoonMovies.add(MovieModel.fromJson(item));
      }

      return right(comingSoonMovies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchNowPlayingMovies() async {
    try {
      var data = await apiService.get(
          endPoint: 'movie/now_playing?language=en-US&page=1');

      List<MovieModel> nowPlayingMovies = [];
      for (var item in data['results']) {
        nowPlayingMovies.add(MovieModel.fromJson(item));
      }

      return right(nowPlayingMovies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchPopularMovies() async {
    try {
      var data =
          await apiService.get(endPoint: 'movie/popular?language=en-US&page=1');

      List<MovieModel> popularMovies = [];
      for (var item in data['results']) {
        popularMovies.add(MovieModel.fromJson(item));
      }

      return right(popularMovies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchTopRatingMovies() async {
    try {
      var data = await apiService.get(
          endPoint: 'movie/top_rated?language=en-US&page=1');

      List<MovieModel> topRatingMovies = [];
      for (var item in data['results']) {
        topRatingMovies.add(MovieModel.fromJson(item));
      }

      return right(topRatingMovies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
