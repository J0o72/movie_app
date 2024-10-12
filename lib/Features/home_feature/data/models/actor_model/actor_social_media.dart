import 'package:equatable/equatable.dart';

class ActorSocialMedia extends Equatable {
  final int? id;
  final String? freebaseMid;
  final String? freebaseId;
  final String? imdbId;
  final int? tvrageId;
  final String? wikidataId;
  final String? facebookId;
  final String? instagramId;
  final String? tiktokId;
  final String? twitterId;
  final String? youtubeId;

  const ActorSocialMedia({
    this.id,
    this.freebaseMid,
    this.freebaseId,
    this.imdbId,
    this.tvrageId,
    this.wikidataId,
    this.facebookId,
    this.instagramId,
    this.tiktokId,
    this.twitterId,
    this.youtubeId,
  });

  factory ActorSocialMedia.fromJson(Map<String, dynamic> json) {
    return ActorSocialMedia(
      id: json['id'] as int?,
      freebaseMid: json['freebase_mid'] as String?,
      freebaseId: json['freebase_id'] as String?,
      imdbId: json['imdb_id'] as String?,
      tvrageId: json['tvrage_id'] as int?,
      wikidataId: json['wikidata_id'] as String?,
      facebookId: json['facebook_id'] as String?,
      instagramId: json['instagram_id'] as String?,
      tiktokId: json['tiktok_id'] as String?,
      twitterId: json['twitter_id'] as String?,
      youtubeId: json['youtube_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'freebase_mid': freebaseMid,
        'freebase_id': freebaseId,
        'imdb_id': imdbId,
        'tvrage_id': tvrageId,
        'wikidata_id': wikidataId,
        'facebook_id': facebookId,
        'instagram_id': instagramId,
        'tiktok_id': tiktokId,
        'twitter_id': twitterId,
        'youtube_id': youtubeId,
      };

  @override
  List<Object?> get props {
    return [
      id,
      freebaseMid,
      freebaseId,
      imdbId,
      tvrageId,
      wikidataId,
      facebookId,
      instagramId,
      tiktokId,
      twitterId,
      youtubeId,
    ];
  }
}
