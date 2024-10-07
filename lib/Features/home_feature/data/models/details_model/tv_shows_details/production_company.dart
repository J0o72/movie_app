import 'package:equatable/equatable.dart';

class ProductionCompany extends Equatable {
  final num? id;
  final dynamic logoPath;
  final String? name;
  final String? originCountry;

  const ProductionCompany({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
      id: json['id'] as num?,
      logoPath: json['logo_path'] as dynamic,
      name: json['name'] as String?,
      originCountry: json['origin_country'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'logo_path': logoPath,
        'name': name,
        'origin_country': originCountry,
      };

  @override
  List<Object?> get props => [id, logoPath, name, originCountry];
}
