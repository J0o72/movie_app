import 'package:dartz/dartz.dart';
import 'package:movie_app/Features/search_feature/data/models/search_model/search_results.dart';
import 'package:movie_app/core/errors/failure.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<SearchResultsModel>>> fetchSearchList(
      {required String searchWord});
}
