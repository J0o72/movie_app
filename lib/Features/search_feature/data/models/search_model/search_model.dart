import 'package:equatable/equatable.dart';
import 'package:movie_app/Features/search_feature/data/models/search_model/search_results.dart';

class SearchModel extends Equatable {
  final int? page;
  final List<SearchResultsModel>? results;
  final int? totalPages;
  final int? totalResults;

  const SearchModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        page: json['page'] as int?,
        results: (json['results'] as List<dynamic>?)
            ?.map((e) => SearchResultsModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        totalPages: json['total_pages'] as int?,
        totalResults: json['total_results'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'page': page,
        'results': results?.map((e) => e.toJson()).toList(),
        'total_pages': totalPages,
        'total_results': totalResults,
      };

  @override
  List<Object?> get props {
    return [
      page,
      results,
      totalPages,
      totalResults,
    ];
  }
}
