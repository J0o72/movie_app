import 'package:dartz/dartz.dart';
import 'package:movie_app/Features/categories_feature/data/models/category_model.dart';
import 'package:movie_app/core/errors/failure.dart';

abstract class CategoryRepo {
  Future<Either<Failure, List<CategoryModel>>> fetchCategoryByOriginalLanguage(
      {required String originalLanguage});
  Future<Either<Failure, List<CategoryModel>>> fetchCategoryByCompany(
      {required String companyID});
  Future<Either<Failure, List<CategoryModel>>> fetchCategoryByNetwork(
      {required String networkID});
}
