import 'package:dartz/dartz.dart';
import 'package:movie_app/Features/home_feature/data/models/favorite_model/favorite_model/fav_result.dart';
import 'package:movie_app/core/errors/failure.dart';

abstract class SavedRepo {
  Future<Either<Failure, void>> addToFav({required dynamic body});
  Future<Either<Failure, List<FavoriteResults>>> favoriteList();
}
