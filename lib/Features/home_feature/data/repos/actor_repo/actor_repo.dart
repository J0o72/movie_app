import 'package:dartz/dartz.dart';
import 'package:movie_app/Features/home_feature/data/models/actor_model/actor_known_for.dart';
import 'package:movie_app/Features/home_feature/data/models/actor_model/actor_model.dart';
import 'package:movie_app/Features/home_feature/data/models/actor_model/actor_social_media.dart';
import 'package:movie_app/core/errors/failure.dart';

abstract class ActorRepo {
  Future<Either<Failure, ActorModel>> fetchActorDetails({required int actorID});
  // Future<Either<Failure, ActorSocialMedia>> fetchActorSocialMedia(
  //     {required int actorID});
  Future<Either<Failure, List<ActorKnownFor>>> fetchActorCredits(
      {required String actorID});
}
