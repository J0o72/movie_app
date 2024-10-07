import 'package:dartz/dartz.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/details_model/details_model.dart';
import 'package:movie_app/core/errors/failure.dart';

abstract class DetailsRepo {
  Future<Either<Failure, DetailsModel>> fetchDetails({required int id});
}
