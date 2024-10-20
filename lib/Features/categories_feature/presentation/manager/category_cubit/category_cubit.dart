import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/categories_feature/data/models/category_model.dart';
import 'package:movie_app/Features/categories_feature/data/repos/category_repo.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.categoryRepo) : super(CategoryInitial());

  final CategoryRepo categoryRepo;

  Future<void> fetchCategoryByOriginalLanguage(
      {required String originalLanguage}) async {
    emit(CategoryLoading());
    var result = await categoryRepo.fetchCategoryByOriginalLanguage(
        originalLanguage: originalLanguage);

    result.fold((failure) {
      emit(
        CategoryFailure(errorMessage: failure.errMessage),
      );
    }, (categoryResults) {
      emit(
        CategorySuccess(categoryResults: categoryResults),
      );
    });
  }

  Future<void> fetchCategoryByNetwork({required String network}) async {
    emit(CategoryLoading());
    var result = await categoryRepo.fetchCategoryByNetwork(networkID: network);

    result.fold((failure) {
      emit(
        CategoryFailure(errorMessage: failure.errMessage),
      );
    }, (categoryResults) {
      emit(
        CategorySuccess(categoryResults: categoryResults),
      );
    });
  }

  Future<void> fetchCategoryByCompany({required String company}) async {
    emit(CategoryLoading());
    var result = await categoryRepo.fetchCategoryByCompany(companyID: company);

    result.fold((failure) {
      emit(
        CategoryFailure(errorMessage: failure.errMessage),
      );
    }, (categoryResults) {
      emit(
        CategorySuccess(categoryResults: categoryResults),
      );
    });
  }
}
