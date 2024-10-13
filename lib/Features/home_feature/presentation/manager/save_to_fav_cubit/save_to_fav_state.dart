part of 'save_to_fav_cubit.dart';

sealed class SaveToFavState extends Equatable {
  const SaveToFavState();

  @override
  List<Object> get props => [];
}

final class SaveToFavInitial extends SaveToFavState {}

final class SaveToFavLoading extends SaveToFavState {}

final class SaveToFavSuccess extends SaveToFavState {}

final class SaveToFavFailure extends SaveToFavState {
  final String errorMessage;

  const SaveToFavFailure({required this.errorMessage});
}
