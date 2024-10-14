import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/Features/home_feature/data/repos/saved_repo/saved_repo.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/utils/api_service.dart';

class SavedRepoImpl implements SavedRepo {
  final ApiService apiService;

  SavedRepoImpl(this.apiService);

  @override
  Future<Either<Failure, void>> addToFav({required dynamic body}) async {
    try {
      var result = await apiService.post(
          endPoint: 'account/21536210/favorite', body: body);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
