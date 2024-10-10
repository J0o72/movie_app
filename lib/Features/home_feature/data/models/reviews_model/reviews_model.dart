import 'package:equatable/equatable.dart';

import 'result.dart';

class ReviewsModel extends Equatable {
  final int? id;
  final int? page;
  final List<ReviewsModelResult>? results;
  final int? totalPages;
  final int? totalResults;

  const ReviewsModel({
    this.id,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory ReviewsModel.fromJson(Map<String, dynamic> json) => ReviewsModel(
        id: json['id'] as int?,
        page: json['page'] as int?,
        results: (json['results'] as List<dynamic>?)
            ?.map((e) => ReviewsModelResult.fromJson(e as Map<String, dynamic>))
            .toList(),
        totalPages: json['total_pages'] as int?,
        totalResults: json['total_results'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'page': page,
        'results': results?.map((e) => e.toJson()).toList(),
        'total_pages': totalPages,
        'total_results': totalResults,
      };

  @override
  List<Object?> get props {
    return [
      id,
      page,
      results,
      totalPages,
      totalResults,
    ];
  }
}
