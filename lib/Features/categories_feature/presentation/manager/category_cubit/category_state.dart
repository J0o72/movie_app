part of 'category_cubit.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class CategorySuccess extends CategoryState {
  final List<CategoryModel> categoryResults;

  const CategorySuccess({required this.categoryResults});
}

final class CategoryFailure extends CategoryState {
  final String errorMessage;

  const CategoryFailure({required this.errorMessage});
}

final class CategoryLoading extends CategoryState {}
