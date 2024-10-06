import 'package:dartz/dartz.dart';
import 'package:movie_app/Features/home_feature/data/models/genres_model/genres_model.dart';
import 'package:movie_app/core/errors/failure.dart';

abstract class GenreRepo {
  Future<Either<Failure, List<GenresModel>>> fetchGenresMovies();
  Future<Either<Failure, List<GenresModel>>> fetchGenresTvShows();
}
