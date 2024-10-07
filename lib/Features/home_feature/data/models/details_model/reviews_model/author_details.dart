import 'package:equatable/equatable.dart';

class AuthorDetails extends Equatable {
  final String? name;
  final String? username;
  final dynamic avatarPath;
  final double? rating;

  const AuthorDetails({
    this.name,
    this.username,
    this.avatarPath,
    this.rating,
  });

  factory AuthorDetails.fromJson(Map<String, dynamic> json) => AuthorDetails(
        name: json['name'] as String?,
        username: json['username'] as String?,
        avatarPath: json['avatar_path'] as dynamic,
        rating: json['rating'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'username': username,
        'avatar_path': avatarPath,
        'rating': rating,
      };

  @override
  List<Object?> get props => [name, username, avatarPath, rating];
}
