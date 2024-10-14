import 'package:equatable/equatable.dart';

import 'fav_result.dart';

class FavoriteModel extends Equatable {
  final int? page;
  final List<FavoriteResults>? results;
  final int? totalPages;
  final int? totalResults;

  const FavoriteModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        page: json['page'] as int?,
        results: (json['results'] as List<dynamic>?)
            ?.map((e) => FavoriteResults.fromJson(e as Map<String, dynamic>))
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
  List<Object?> get props => [page, results, totalPages, totalResults];
}
