import 'package:equatable/equatable.dart';

class SearchResultsModel extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final List<dynamic>? genreIds;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
  final String? mediaType;

  const SearchResultsModel({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.mediaType,
  });

  factory SearchResultsModel.fromJson(Map<String, dynamic> json) =>
      SearchResultsModel(
        adult: json['adult'] as bool?,
        backdropPath: json['backdrop_path'] as String?,
        genreIds: json['genre_ids'] as List<dynamic>?,
        id: json['id'] as int?,
        originalLanguage: json['original_language'] as String?,
        originalTitle: json['original_title'] as String?,
        overview: json['overview'] as String?,
        popularity: (json['popularity'] as num?)?.toDouble(),
        posterPath: json['poster_path'] as String?,
        releaseDate: json['release_date'] as String?,
        title: json['title'] as String?,
        video: json['video'] as bool?,
        voteAverage: (json['vote_average'] as num?)?.toDouble(),
        voteCount: json['vote_count'] as int?,
        mediaType: json['media_type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'adult': adult,
        'backdrop_path': backdropPath,
        'genre_ids': genreIds,
        'id': id,
        'original_language': originalLanguage,
        'original_title': originalTitle,
        'overview': overview,
        'popularity': popularity,
        'poster_path': posterPath,
        'release_date': releaseDate,
        'title': title,
        'video': video,
        'vote_average': voteAverage,
        'vote_count': voteCount,
        'media_type': mediaType,
      };

  @override
  List<Object?> get props {
    return [
      adult,
      backdropPath,
      genreIds,
      id,
      originalLanguage,
      originalTitle,
      overview,
      popularity,
      posterPath,
      releaseDate,
      title,
      video,
      voteAverage,
      voteCount,
      mediaType,
    ];
  }
}
