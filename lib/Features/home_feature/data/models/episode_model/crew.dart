import 'package:equatable/equatable.dart';

class Crew extends Equatable {
  final String? job;
  final String? department;
  final String? creditId;
  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final dynamic profilePath;

  const Crew({
    this.job,
    this.department,
    this.creditId,
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
  });

  factory Crew.fromJson(Map<String, dynamic> json) => Crew(
        job: json['job'] as String?,
        department: json['department'] as String?,
        creditId: json['credit_id'] as String?,
        adult: json['adult'] as bool?,
        gender: json['gender'] as int?,
        id: json['id'] as int?,
        knownForDepartment: json['known_for_department'] as String?,
        name: json['name'] as String?,
        originalName: json['original_name'] as String?,
        popularity: (json['popularity'] as num?)?.toDouble(),
        profilePath: json['profile_path'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'job': job,
        'department': department,
        'credit_id': creditId,
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
      job,
      department,
      creditId,
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
