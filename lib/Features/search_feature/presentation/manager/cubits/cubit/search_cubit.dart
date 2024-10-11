import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/search_feature/data/models/search_model/search_results.dart';
import 'package:movie_app/Features/search_feature/data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;

  Future<void> fetchSearchResults({required String searchWord}) async {
    emit(SearchLoading());
    var result = await searchRepo.fetchSearchList(searchWord: searchWord);

    result.fold((failure) {
      emit(
        SearchFailure(errorMessage: failure.errMessage),
      );
    }, (searchResults) {
      emit(
        SearchSuccess(searchResult: searchResults),
      );
    });
  }
}
