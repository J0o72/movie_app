import 'package:dartz/dartz.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/casts_model.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/details_model/details_model.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/reviews_model/result.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/tv_shows_details/tv_shows_details_model.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/Features/home_feature/data/models/trailler_model/result.dart';
import 'package:movie_app/Features/home_feature/data/models/tv_shows_model/tv_shows_model.dart';
import 'package:movie_app/core/errors/failure.dart';

abstract class DetailsRepo {
  Future<Either<Failure, DetailsModel>> fetchDetails({required int id});
  Future<Either<Failure, TvShowsDetailsModel>> fetchTvShowsDetails(
      {required int id});

  Future<Either<Failure, List<CastsModel>>> fetchDetailsCast(
      {required int id, required String fromWhere});
  Future<Either<Failure, List<ResultReviewsModel>>> fetchDetailsReviews(
      {required int id, required String fromWhere});
  Future<Either<Failure, List<MovieModel>>> fetchSimilar({required int id});
  Future<Either<Failure, List<TvShowsModel>>> fetchSimilarTv({required int id});
  Future<Either<Failure, List<ResultReviewsModel>>> fetchReviewsList(
      {required int id, required String fromWhere});
  Future<Either<Failure, List<CastsModel>>> fetchCastList(
      {required int id, required String fromWhere});
  Future<Either<Failure, TraillerResult>> fetchTrailler(
      {required int id, required String fromWhere});
}
