import 'package:equatable/equatable.dart';

class Result extends Equatable {
  final String? iso6391;
  final String? iso31661;
  final String? name;
  final String? key;
  final String? site;
  final int? size;
  final String? type;
  final bool? official;
  final DateTime? publishedAt;
  final String? id;

  const Result({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        iso6391: json['iso_639_1'] as String?,
        iso31661: json['iso_3166_1'] as String?,
        name: json['name'] as String?,
        key: json['key'] as String?,
        site: json['site'] as String?,
        size: json['size'] as int?,
        type: json['type'] as String?,
        official: json['official'] as bool?,
        publishedAt: json['published_at'] == null
            ? null
            : DateTime.parse(json['published_at'] as String),
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'iso_639_1': iso6391,
        'iso_3166_1': iso31661,
        'name': name,
        'key': key,
        'site': site,
        'size': size,
        'type': type,
        'official': official,
        'published_at': publishedAt?.toIso8601String(),
        'id': id,
      };

  @override
  List<Object?> get props {
    return [
      iso6391,
      iso31661,
      name,
      key,
      site,
      size,
      type,
      official,
      publishedAt,
      id,
    ];
  }
}
