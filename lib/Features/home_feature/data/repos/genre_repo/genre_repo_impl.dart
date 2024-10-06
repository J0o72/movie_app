import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/Features/home_feature/data/models/genres_model/genres_model.dart';
import 'package:movie_app/Features/home_feature/data/repos/genre_repo/genre_repo.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/utils/api_service.dart';

class GenreRepoImpl implements GenreRepo {
  GenreRepoImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<Either<Failure, List<GenresModel>>> fetchGenresMovies() async {
    try {
      var data = await apiService.get(endPoint: 'genre/movie/list?language=en');

      List<GenresModel> genreMovies = [];
      for (var item in data['genres']) {
        genreMovies.add(GenresModel.fromJson(item));
      }
      return right(genreMovies.toList());
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<GenresModel>>> fetchGenresTvShows() async {
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
