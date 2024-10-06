import 'package:dartz/dartz.dart';
import 'package:movie_app/Features/home_feature/data/models/tv_shows_model/tv_shows_model.dart';
import 'package:movie_app/core/errors/failure.dart';

abstract class CollectionsRepo {
  Future<Either<Failure, List<TvShowsModel>>> fetchCollectionsOf(
      {required String collectionOf, required String typeOf});
}
