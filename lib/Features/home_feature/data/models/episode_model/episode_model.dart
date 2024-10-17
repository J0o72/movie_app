import 'package:equatable/equatable.dart';

import 'crew.dart';
import 'guest_star.dart';

class EpisodeModel extends Equatable {
  final String? airDate;
  final int? episodeNumber;
  final String? episodeType;
  final int? id;
  final String? name;
  final String? overview;
  final String? productionCode;
  final int? runtime;
  final int? seasonNumber;
  final int? showId;
  final String? stillPath;
  final double? voteAverage;
  final int? voteCount;
  final List<Crew>? crew;
  final List<GuestStar>? guestStars;

  const EpisodeModel({
    this.airDate,
    this.episodeNumber,
    this.episodeType,
    this.id,
    this.name,
    this.overview,
    this.productionCode,
    this.runtime,
    this.seasonNumber,
    this.showId,
    this.stillPath,
    this.voteAverage,
    this.voteCount,
    this.crew,
    this.guestStars,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) => EpisodeModel(
        airDate: json['air_date'] as String?,
        episodeNumber: json['episode_number'] as int?,
        episodeType: json['episode_type'] as String?,
        id: json['id'] as int?,
        name: json['name'] as String?,
        overview: json['overview'] as String?,
        productionCode: json['production_code'] as String?,
        runtime: json['runtime'] as int?,
        seasonNumber: json['season_number'] as int?,
        showId: json['show_id'] as int?,
        stillPath: json['still_path'] as String?,
        voteAverage: (json['vote_average'] as num?)?.toDouble(),
        voteCount: json['vote_count'] as int?,
        crew: (json['crew'] as List<dynamic>?)
            ?.map((e) => Crew.fromJson(e as Map<String, dynamic>))
            .toList(),
        guestStars: (json['guest_stars'] as List<dynamic>?)
            ?.map((e) => GuestStar.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'air_date': airDate,
        'episode_number': episodeNumber,
        'episode_type': episodeType,
        'id': id,
        'name': name,
        'overview': overview,
        'production_code': productionCode,
        'runtime': runtime,
        'season_number': seasonNumber,
        'show_id': showId,
        'still_path': stillPath,
        'vote_average': voteAverage,
        'vote_count': voteCount,
        'crew': crew?.map((e) => e.toJson()).toList(),
        'guest_stars': guestStars?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      airDate,
      episodeNumber,
      episodeType,
      id,
      name,
      overview,
      productionCode,
      runtime,
      seasonNumber,
      showId,
      stillPath,
      voteAverage,
      voteCount,
      crew,
      guestStars,
    ];
  }
}
