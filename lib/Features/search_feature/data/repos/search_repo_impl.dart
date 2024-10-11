import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/Features/search_feature/data/models/search_model/search_results.dart';
import 'package:movie_app/Features/search_feature/data/repos/search_repo.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/utils/api_service.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<SearchResultsModel>>> fetchSearchList(
      {required String searchWord}) async {
    try {
      List<SearchResultsModel> searchResults = [];
      var data = await apiService.get(
          endPoint:
              'search/multi?query=$searchWord&include_adult=false&language=en-US&page=1');

      for (int i = 1; i <= data['total_pages']; i++) {
        var allData = await apiService.get(
            endPoint:
                'search/multi?query=$searchWord&include_adult=false&language=en-US&page=$i');

        for (var item in allData['results']) {
          searchResults.add(SearchResultsModel.fromJson(item));
        }
      }

      return right(searchResults);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
