import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/Features/home_feature/data/models/actor_model/actor_known_for.dart';
import 'package:movie_app/Features/home_feature/data/models/actor_model/actor_model.dart';
import 'package:movie_app/Features/home_feature/data/models/actor_model/actor_social_media.dart';
import 'package:movie_app/Features/home_feature/data/repos/actor_repo/actor_repo.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/utils/api_service.dart';

class ActorRepoImpl implements ActorRepo {
  final ApiService apiService;

  ActorRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<ActorKnownFor>>> fetchActorCredits(
      {required String actorID}) async {
    try {
      List<ActorKnownFor> actorCredits = [];

      var data = await apiService.get(
          endPoint: 'person/$actorID/combined_credits?language=en-US');

      for (var item in data['cast']) {
        actorCredits.add(ActorKnownFor.fromJson(item));
      }

      return right(actorCredits);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ActorModel>> fetchActorDetails(
      {required int actorID}) async {
    try {
      var data =
          await apiService.get(endPoint: 'person/$actorID?language=en-US');

      return right(ActorModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  // @override
  // Future<Either<Failure, ActorSocialMedia>> fetchActorSocialMedia(
  //     {required int actorID}) async {
  //   try {
  //     var data = await apiService.get(endPoint: 'person/$actorID/external_ids');

  //     return right(ActorSocialMedia.fromJson(data));
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(ServerFailure.fromDioError(e));
  //     } else {
  //       return left(ServerFailure(e.toString()));
  //     }
  //   }
  // }
}
