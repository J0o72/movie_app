import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/casts_model.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/details_model/details_model.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/reviews_model/result.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/tv_shows_details/tv_shows_details_model.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/Features/home_feature/data/repos/details_repo/details_repo.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/utils/api_service.dart';

class DetailsRepoImpl implements DetailsRepo {
  final ApiService apiService;

  DetailsRepoImpl(this.apiService);
  @override
  Future<Either<Failure, DetailsModel>> fetchDetails({required int id}) async {
    try {
      var data = await apiService.get(endPoint: 'movie/$id?language=en-US');

      return right(DetailsModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<CastsModel>>> fetchDetailsCast(
      {required int id}) async {
    try {
      var data =
          await apiService.get(endPoint: 'movie/$id/credits?language=en-US');

      List<CastsModel> casts = [];

      for (var item in data['cast']) {
        casts.add(CastsModel.fromJson(item));
      }

      return right(casts);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ResultReviewsModel>>> fetchDetailsReviews(
      {required int id}) async {
    try {
      var data = await apiService.get(
          endPoint: 'movie/$id/reviews?language=en-US&page=1');

      List<ResultReviewsModel> reviewsList = [];

      for (var item in data['results']) {
        reviewsList.add(ResultReviewsModel.fromJson(item));
      }

      return right(reviewsList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchSimilar(
      {required int id}) async {
    try {
      var data = await apiService.get(
          endPoint: 'movie/$id/similar?language=en-US&page=1');

      List<MovieModel> similarMovies = [];
      for (var item in data['results']) {
        similarMovies.add(MovieModel.fromJson(item));
      }

      return right(similarMovies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, TvShowsDetailsModel>> fetchTvShowsDetails(
      {required int id}) async {
    try {
      var data = await apiService.get(endPoint: 'tv/$id?language=en-US');

      return right(TvShowsDetailsModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
