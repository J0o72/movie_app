import 'package:equatable/equatable.dart';

class CreatedBy extends Equatable {
  final int? id;
  final String? creditId;
  final String? name;
  final String? originalName;
  final int? gender;
  final String? profilePath;

  const CreatedBy({
    this.id,
    this.creditId,
    this.name,
    this.originalName,
    this.gender,
    this.profilePath,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json['id'] as int?,
        creditId: json['credit_id'] as String?,
        name: json['name'] as String?,
        originalName: json['original_name'] as String?,
        gender: json['gender'] as int?,
        profilePath: json['profile_path'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'credit_id': creditId,
        'name': name,
        'original_name': originalName,
        'gender': gender,
        'profile_path': profilePath,
      };

  @override
  List<Object?> get props {
    return [
      id,
      creditId,
      name,
      originalName,
      gender,
      profilePath,
    ];
  }
}
