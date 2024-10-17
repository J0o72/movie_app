import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/tv_shows_details/season.dart';
import 'package:movie_app/Features/home_feature/data/repos/season_repo/season_repo.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/utils/api_service.dart';

class SeasonRepoImpl implements SeasonRepo {
  final ApiService apiService;

  SeasonRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<SeasonModel>>> fetchSeasons(
      {required int id}) async {
    try {
      List<SeasonModel> seasons = [];
      var data = await apiService.get(endPoint: 'tv/$id?language=en-US');

      for (var item in data['seasons']) {
        if (item['name'] != 'Specials') {
          seasons.add(SeasonModel.fromJson(item));
        }
      }
      return right(seasons);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
