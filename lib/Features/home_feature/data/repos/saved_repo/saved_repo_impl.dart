import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/Features/home_feature/data/models/favorite_model/favorite_model/fav_result.dart';
import 'package:movie_app/Features/home_feature/data/repos/saved_repo/saved_repo.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/utils/api_service.dart';

class SavedRepoImpl implements SavedRepo {
  final ApiService apiService;

  SavedRepoImpl(this.apiService);

  @override
  Future<Either<Failure, void>> addToFav({required dynamic body}) async {
    try {
      var data = await apiService.post(
          endPoint: 'account/21536210/favorite', body: body);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<FavoriteResults>>> favoriteList() async {
    try {
      List<FavoriteResults> favList = [];

      var favTvShows = await apiService.get(
          endPoint:
              'account/21536210/favorite/tv?language=en-US&page=1&sort_by=created_at.asc');

      for (int i = 1; i < favTvShows['total_pages']; i++) {
        var allData = await apiService.get(
            endPoint:
                'account/21536210/favorite/tv?language=en-US&page=$i&sort_by=created_at.asc');

        for (var item in allData['results']) {
          favList.add(FavoriteResults.fromJson(item));
        }
      }

      var favMovies = await apiService.get(
          endPoint:
              'account/21536210/favorite/movies?language=en-US&page=1&sort_by=created_at.asc');

      for (int i = 1; i < favMovies['total_pages']; i++) {
        var allData = await apiService.get(
            endPoint:
                'account/21536210/favorite/movies?language=en-US&page=$i&sort_by=created_at.asc');

        for (var item in allData['results']) {
          favList.add(FavoriteResults.fromJson(item));
        }
      }
      return right(favList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
