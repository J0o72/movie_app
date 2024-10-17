import 'package:dartz/dartz.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/tv_shows_details/season.dart';
import 'package:movie_app/Features/home_feature/data/models/episode_model/episode_model.dart';
import 'package:movie_app/core/errors/failure.dart';

abstract class SeasonRepo {
  Future<Either<Failure, List<SeasonModel>>> fetchSeasons({required int id});
  Future<Either<Failure, List<EpisodeModel>>> fetchSeasonEpisodes(
      {required int seasonId, required int seasonNumber});
}
