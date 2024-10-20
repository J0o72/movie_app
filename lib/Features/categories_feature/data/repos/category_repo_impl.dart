import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/Features/categories_feature/data/models/category_model.dart';
import 'package:movie_app/Features/categories_feature/data/repos/category_repo.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/utils/api_service.dart';

class CategoryRepoImpl implements CategoryRepo {
  final ApiService apiService;

  CategoryRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<CategoryModel>>> fetchCategoryByOriginalLanguage(
      {required String originalLanguage}) async {
    try {
      List<CategoryModel> collections = [];
      var dataTv = await apiService.get(
          endPoint:
              'discover/tv?first_air_date.gte=2024-01-01&include_adult=false&include_null_first_air_dates=false&page=1&sort_by=popularity.desc&with_original_language=$originalLanguage');

      for (int i = 1; i <= dataTv['total_pages']; i++) {
        var data = await apiService.get(
            endPoint:
                'discover/tv?first_air_date.gte=2024-01-01&include_adult=false&include_null_first_air_dates=false&page=$i&sort_by=popularity.desc&with_original_language=$originalLanguage');
        for (var item in data['results']) {
          collections.add(CategoryModel.fromJson(item));
        }
        if (i == 5) {
          break;
        }
      }

      var dataMovie = await apiService.get(
          endPoint:
              'discover/movie?include_adult=false&include_video=false&page=1&primary_release_date.gte=2024-01-01&sort_by=popularity.desc&with_original_language=$originalLanguage');

      for (int i = 1; i <= dataMovie['total_pages']; i++) {
        var data = await apiService.get(
            endPoint:
                'discover/movie?include_adult=false&include_video=false&page=$i&primary_release_date.gte=2024-01-01&sort_by=popularity.desc&with_original_language=$originalLanguage');
        for (var item in data['results']) {
          collections.add(CategoryModel.fromJson(item));
        }
        if (i == 5) {
          break;
        }
      }

      collections.shuffle();
      return right(collections);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> fetchCategoryByCompany(
      {required String companyID}) async {
    try {
      List<CategoryModel> collections = [];

      var dataTv = await apiService.get(
          endPoint:
              'discover/tv?include_adult=false&include_null_first_air_dates=false&language=en-US&page=1&sort_by=popularity.desc&with_companies=$companyID');

      for (int i = 1; i <= dataTv['total_pages']; i++) {
        var data = await apiService.get(
            endPoint:
                'discover/tv?include_adult=false&include_null_first_air_dates=false&language=en-US&page=$i&sort_by=popularity.desc&with_companies=$companyID');
        for (var item in data['results']) {
          collections.add(CategoryModel.fromJson(item));
        }
        if (i == 5) {
          break;
        }
      }

      var dataMovie = await apiService.get(
          endPoint:
              'discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&with_companies=$companyID');

      for (int i = 1; i <= dataMovie['total_pages']; i++) {
        var data = await apiService.get(
            endPoint:
                'discover/movie?include_adult=false&include_video=false&language=en-US&page=$i&sort_by=popularity.desc&with_companies=$companyID');
        for (var item in data['results']) {
          collections.add(CategoryModel.fromJson(item));
        }

        if (i == 5) {
          break;
        }
      }

      collections.shuffle();
      return right(collections);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> fetchCategoryByNetwork(
      {required String networkID}) async {
    try {
      List<CategoryModel> collections = [];
      var dataTv = await apiService.get(
          endPoint:
              'discover/tv?include_adult=false&include_null_first_air_dates=false&language=en-US&page=1&sort_by=popularity.desc&with_networks=$networkID');

      for (int i = 1; i <= dataTv['total_pages']; i++) {
        var data = await apiService.get(
            endPoint:
                'discover/tv?include_adult=false&include_null_first_air_dates=false&language=en-US&page=$i&sort_by=popularity.desc&with_networks=$networkID');
        for (var item in data['results']) {
          collections.add(CategoryModel.fromJson(item));
        }

        if (i == 10) {
          break;
        }
      }

      return right(collections);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
