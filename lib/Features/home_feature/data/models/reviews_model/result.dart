import 'package:equatable/equatable.dart';

import 'author_details.dart';

class ReviewsModelResult extends Equatable {
  final String? author;
  final AuthorDetails? authorDetails;
  final String? content;
  final DateTime? createdAt;
  final String? id;
  final DateTime? updatedAt;
  final String? url;

  const ReviewsModelResult({
    this.author,
    this.authorDetails,
    this.content,
    this.createdAt,
    this.id,
    this.updatedAt,
    this.url,
  });

  factory ReviewsModelResult.fromJson(Map<String, dynamic> json) =>
      ReviewsModelResult(
        author: json['author'] as String?,
        authorDetails: json['author_details'] == null
            ? null
            : AuthorDetails.fromJson(
                json['author_details'] as Map<String, dynamic>),
        content: json['content'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        id: json['id'] as String?,
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'author': author,
        'author_details': authorDetails?.toJson(),
        'content': content,
        'created_at': createdAt?.toIso8601String(),
        'id': id,
        'updated_at': updatedAt?.toIso8601String(),
        'url': url,
      };

  @override
  List<Object?> get props {
    return [
      author,
      authorDetails,
      content,
      createdAt,
      id,
      updatedAt,
      url,
    ];
  }
}
