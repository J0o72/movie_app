import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/casts_model.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/details_model/details_model.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/reviews_model/result.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/tv_shows_details/tv_shows_details_model.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/Features/home_feature/data/models/trailler_model/result.dart';
import 'package:movie_app/Features/home_feature/data/models/tv_shows_model/tv_shows_model.dart';
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
      {required int id, required String fromWhere}) async {
    try {
      var data = await apiService.get(
          endPoint: '$fromWhere/$id/credits?language=en-US');

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
      {required int id, required String fromWhere}) async {
    try {
      var data = await apiService.get(
          endPoint: '$fromWhere/$id/reviews?language=en-US&page=1');

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
  Future<Either<Failure, List<TvShowsModel>>> fetchSimilarTv(
      {required int id}) async {
    try {
      var data = await apiService.get(
          endPoint: 'tv/$id/similar?language=en-US&page=1');

      List<TvShowsModel> similarTv = [];
      for (var item in data['results']) {
        similarTv.add(TvShowsModel.fromJson(item));
      }

      return right(similarTv);
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

  @override
  Future<Either<Failure, List<ResultReviewsModel>>> fetchReviewsList(
      {required int id, required String fromWhere}) async {
    try {
      List<ResultReviewsModel> reviewsList = [];

      var data = await apiService.get(
          endPoint: '$fromWhere/$id/reviews?language=en-US&page=1');

      for (int i = 1; i <= data['total_pages']; i++) {
        var allData = await apiService.get(
            endPoint: '$fromWhere/$id/reviews?language=en-US&page=$i');

        for (var item in allData['results']) {
          reviewsList.add(ResultReviewsModel.fromJson(item));
        }
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
  Future<Either<Failure, List<CastsModel>>> fetchCastList(
      {required int id, required String fromWhere}) async {
    try {
      var data = await apiService.get(
          endPoint: '$fromWhere/$id/credits?language=en-US');

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
  Future<Either<Failure, TraillerResult>> fetchTrailler(
      {required int id, required String fromWhere}) async {
    try {
      TraillerResult? trailler;
      var data = await apiService.get(
          endPoint: '$fromWhere/$id/videos?language=en-US');

      for (var item in data['results']) {
        if (item['type'] == 'Trailer') {
          trailler = TraillerResult.fromJson(item);
          break;
        }
      }
      return right(trailler!);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
