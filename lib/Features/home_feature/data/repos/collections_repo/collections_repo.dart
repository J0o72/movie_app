import 'package:dartz/dartz.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/core/errors/failure.dart';

abstract class CollectionsRepo {
  Future<Either<Failure, List<MovieModel>>> fetchCollectionsOf(
      {required String collectionOf, required String typeOf});
}
