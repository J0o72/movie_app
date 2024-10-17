import 'package:equatable/equatable.dart';

class SeasonModel extends Equatable {
  final dynamic airDate;
  final num? episodeCount;
  final num? id;
  final String? name;
  final String? overview;
  final dynamic posterPath;
  final num? seasonNumber;
  final double? voteAverage;

  const SeasonModel({
    this.airDate,
    this.episodeCount,
    this.id,
    this.name,
    this.overview,
    this.posterPath,
    this.seasonNumber,
    this.voteAverage,
  });

  factory SeasonModel.fromJson(Map<String, dynamic> json) => SeasonModel(
        airDate: json['air_date'] as dynamic,
        episodeCount: json['episode_count'] as num?,
        id: json['id'] as num?,
        name: json['name'] as String?,
        overview: json['overview'] as String?,
        posterPath: json['poster_path'] as dynamic,
        seasonNumber: json['season_number'] as num?,
        voteAverage: json['vote_average'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'air_date': airDate,
        'episode_count': episodeCount,
        'id': id,
        'name': name,
        'overview': overview,
        'poster_path': posterPath,
        'season_number': seasonNumber,
        'vote_average': voteAverage,
      };

  @override
  List<Object?> get props {
    return [
      airDate,
      episodeCount,
      id,
      name,
      overview,
      posterPath,
      seasonNumber,
      voteAverage,
    ];
  }
}
