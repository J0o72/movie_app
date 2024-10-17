import 'package:equatable/equatable.dart';

class GuestStar extends Equatable {
  final String? character;
  final String? creditId;
  final int? order;
  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;

  const GuestStar({
    this.character,
    this.creditId,
    this.order,
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
  });

  factory GuestStar.fromJson(Map<String, dynamic> json) => GuestStar(
        character: json['character'] as String?,
        creditId: json['credit_id'] as String?,
        order: json['order'] as int?,
        adult: json['adult'] as bool?,
        gender: json['gender'] as int?,
        id: json['id'] as int?,
        knownForDepartment: json['known_for_department'] as String?,
        name: json['name'] as String?,
        originalName: json['original_name'] as String?,
        popularity: (json['popularity'] as num?)?.toDouble(),
        profilePath: json['profile_path'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'character': character,
        'credit_id': creditId,
        'order': order,
        'adult': adult,
        'gender': gender,
        'id': id,
        'known_for_department': knownForDepartment,
        'name': name,
        'original_name': originalName,
        'popularity': popularity,
        'profile_path': profilePath,
      };

  @override
  List<Object?> get props {
    return [
      character,
      creditId,
      order,
      adult,
      gender,
      id,
      knownForDepartment,
      name,
      originalName,
      popularity,
      profilePath,
    ];
  }
}
