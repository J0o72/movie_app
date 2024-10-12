import 'package:equatable/equatable.dart';

class ActorModel extends Equatable {
  final bool? adult;
  final List<String>? alsoKnownAs;
  final String? biography;
  final String? birthday;
  final dynamic deathday;
  final int? gender;
  final dynamic homepage;
  final int? id;
  final String? imdbId;
  final String? knownForDepartment;
  final String? name;
  final String? placeOfBirth;
  final double? popularity;
  final String? profilePath;

  const ActorModel({
    this.adult,
    this.alsoKnownAs,
    this.biography,
    this.birthday,
    this.deathday,
    this.gender,
    this.homepage,
    this.id,
    this.imdbId,
    this.knownForDepartment,
    this.name,
    this.placeOfBirth,
    this.popularity,
    this.profilePath,
  });

  factory ActorModel.fromJson(Map<String, dynamic> json) => ActorModel(
        adult: json['adult'] as bool?,
        alsoKnownAs: json['also_known_as'] as List<String>?,
        biography: json['biography'] as String?,
        birthday: json['birthday'] as String?,
        deathday: json['deathday'] as dynamic,
        gender: json['gender'] as int?,
        homepage: json['homepage'] as dynamic,
        id: json['id'] as int?,
        imdbId: json['imdb_id'] as String?,
        knownForDepartment: json['known_for_department'] as String?,
        name: json['name'] as String?,
        placeOfBirth: json['place_of_birth'] as String?,
        popularity: (json['popularity'] as num?)?.toDouble(),
        profilePath: json['profile_path'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'adult': adult,
        'also_known_as': alsoKnownAs,
        'biography': biography,
        'birthday': birthday,
        'deathday': deathday,
        'gender': gender,
        'homepage': homepage,
        'id': id,
        'imdb_id': imdbId,
        'known_for_department': knownForDepartment,
        'name': name,
        'place_of_birth': placeOfBirth,
        'popularity': popularity,
        'profile_path': profilePath,
      };

  @override
  List<Object?> get props {
    return [
      adult,
      alsoKnownAs,
      biography,
      birthday,
      deathday,
      gender,
      homepage,
      id,
      imdbId,
      knownForDepartment,
      name,
      placeOfBirth,
      popularity,
      profilePath,
    ];
  }
}
