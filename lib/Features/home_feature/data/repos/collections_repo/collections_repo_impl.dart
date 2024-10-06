import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/Features/home_feature/data/models/tv_shows_model/tv_shows_model.dart';
import 'package:movie_app/Features/home_feature/data/repos/collections_repo/collections_repo.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/utils/api_service.dart';

class CollectionsRepoImpl implements CollectionsRepo {
  final ApiService apiService;

  CollectionsRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<TvShowsModel>>> fetchCollectionsOf(
      {required String collectionOf, required String typeOf}) async {
    try {
      List<TvShowsModel> collection = [];
      for (int i = 0; i < 5; i++) {
        var data = await apiService.get(
            endPoint: '$typeOf/$collectionOf?language=en-US&page=$i');

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
}
