part of 'collections_cubit.dart';

sealed class CollectionsState extends Equatable {
  const CollectionsState();

  @override
  List<Object> get props => [];
}

final class CollectionsInitial extends CollectionsState {}

final class CollectionsSuccess extends CollectionsState {
  final List<MovieModel> collection;

  const CollectionsSuccess({required this.collection});
}

final class CollectionsFailure extends CollectionsState {
  final String errorMessage;

  const CollectionsFailure({required this.errorMessage});
}

final class CollectionsLoading extends CollectionsState {}
