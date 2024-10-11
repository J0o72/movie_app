part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<SearchResultsModel> searchResult;

  const SearchSuccess({required this.searchResult});
}

final class SearchFailure extends SearchState {
  final String errorMessage;

  const SearchFailure({required this.errorMessage});
}
