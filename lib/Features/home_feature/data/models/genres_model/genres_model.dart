import 'package:equatable/equatable.dart';

class GenresModel extends Equatable {
  final int? id;
  final String? name;

  const GenresModel({this.id, this.name});

  factory GenresModel.fromJson(Map<String, dynamic> json) => GenresModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  @override
  List<Object?> get props => [id, name];
}
