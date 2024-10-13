import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/models/actor_model/actor_model.dart';
import 'package:movie_app/Features/home_feature/data/models/actor_model/actor_social_media.dart';
import 'package:movie_app/Features/home_feature/data/repos/actor_repo/actor_repo.dart';

part 'actor_profile_state.dart';

class ActorProfileCubit extends Cubit<ActorProfileState> {
  ActorProfileCubit(this.actorRepo) : super(ActorProfileInitial());

  final ActorRepo actorRepo;

  Future<void> fetchActorDetails({required int actorID}) async {
    emit(ActorProfileLoading());
    var result = await actorRepo.fetchActorDetails(actorID: actorID);

    result.fold((failure) {
      emit(
        ActorProfileFailure(errorMessage: failure.errMessage),
      );
    }, (actorDetails) {
      emit(
        ActorProfileSuccess(actorDetails: actorDetails),
      );
    });
  }
}
