import 'package:equatable/equatable.dart';

class ActorKnownFor extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? firstAirDate;
  final String? releaseDate;
  final String? name;
  final double? voteAverage;
  final int? voteCount;
  final String? character;
  final String? creditId;
  final int? episodeCount;
  final String? mediaType;
  final String? title;

  const ActorKnownFor({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.firstAirDate,
    this.name,
    this.voteAverage,
    this.voteCount,
    this.character,
    this.creditId,
    this.episodeCount,
    this.mediaType,
    this.originalTitle,
    this.releaseDate,
    this.title,
  });

  factory ActorKnownFor.fromJson(Map<String, dynamic> json) => ActorKnownFor(
        adult: json['adult'] as bool?,
        backdropPath: json['backdrop_path'] as String?,
        genreIds: json['genre_ids'] as List<int>?,
        id: json['id'] as int?,
        originCountry: json['origin_country'] as List<String>?,
        originalLanguage: json['original_language'] as String?,
        originalName: json['original_name'] as String?,
        overview: json['overview'] as String?,
        popularity: (json['popularity'] as num?)?.toDouble(),
        posterPath: json['poster_path'] as String?,
        firstAirDate: json['first_air_date'] as String?,
        name: json['name'] as String?,
        voteAverage: (json['vote_average'] as num?)?.toDouble(),
        voteCount: json['vote_count'] as int?,
        character: json['character'] as String?,
        creditId: json['credit_id'] as String?,
        episodeCount: json['episode_count'] as int?,
        mediaType: json['media_type'] as String?,
        originalTitle: json['original_title'] as String?,
        releaseDate: json['release_date'] as String?,
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'adult': adult,
        'backdrop_path': backdropPath,
        'genre_ids': genreIds,
        'id': id,
        'origin_country': originCountry,
        'original_language': originalLanguage,
        'original_name': originalName,
        'overview': overview,
        'popularity': popularity,
        'poster_path': posterPath,
        'first_air_date': firstAirDate,
        'name': name,
        'vote_average': voteAverage,
        'vote_count': voteCount,
        'character': character,
        'credit_id': creditId,
        'episode_count': episodeCount,
        'media_type': mediaType,
        'original_title': originalTitle,
        'release_date': releaseDate,
        'title': title,
      };

  @override
  List<Object?> get props {
    return [
      adult,
      backdropPath,
      genreIds,
      id,
      originCountry,
      originalLanguage,
      originalName,
      overview,
      popularity,
      posterPath,
      firstAirDate,
      name,
      voteAverage,
      voteCount,
      character,
      creditId,
      episodeCount,
      mediaType,
      originalTitle,
      releaseDate,
      title,
    ];
  }
}
