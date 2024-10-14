part of 'saved_cubit.dart';

sealed class SavedState extends Equatable {
  const SavedState();

  @override
  List<Object> get props => [];
}

final class SavedInitial extends SavedState {}

final class SavedSuccess extends SavedState {
  final List<FavoriteResults> favList;

  const SavedSuccess({required this.favList});
}

final class SavedLoading extends SavedState {}

final class SavedFailure extends SavedState {
  final String errorMessage;

  const SavedFailure({required this.errorMessage});
}
