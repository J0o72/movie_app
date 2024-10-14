import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';

abstract class SavedRepo {
  Future<Either<Failure, void>> addToFav({required dynamic body});
}
