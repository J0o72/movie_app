import 'package:equatable/equatable.dart';

class Network extends Equatable {
  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  const Network({this.id, this.logoPath, this.name, this.originCountry});

  factory Network.fromJson(Map<String, dynamic> json) => Network(
        id: json['id'] as int?,
        logoPath: json['logo_path'] as String?,
        name: json['name'] as String?,
        originCountry: json['origin_country'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'logo_path': logoPath,
        'name': name,
        'origin_country': originCountry,
      };

  @override
  List<Object?> get props => [id, logoPath, name, originCountry];
}
