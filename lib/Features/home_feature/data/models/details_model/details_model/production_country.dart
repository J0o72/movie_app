import 'package:equatable/equatable.dart';

class ProductionCountry extends Equatable {
  final String? iso31661;
  final String? name;

  const ProductionCountry({this.iso31661, this.name});

  factory ProductionCountry.fromJson(Map<String, dynamic> json) {
    return ProductionCountry(
      iso31661: json['iso_3166_1'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'iso_3166_1': iso31661,
        'name': name,
      };

  @override
  List<Object?> get props => [iso31661, name];
}
