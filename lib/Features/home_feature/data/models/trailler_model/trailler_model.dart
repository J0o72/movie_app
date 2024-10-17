import 'package:equatable/equatable.dart';

import 'result.dart';

class TraillerModel extends Equatable {
  final int? id;
  final List<TraillerResult>? results;

  const TraillerModel({this.id, this.results});

  factory TraillerModel.fromJson(Map<String, dynamic> json) => TraillerModel(
        id: json['id'] as int?,
        results: (json['results'] as List<dynamic>?)
            ?.map((e) => TraillerResult.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'results': results?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [id, results];
}
