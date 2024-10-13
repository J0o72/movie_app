import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/models/actor_model/actor_social_media.dart';
import 'package:movie_app/Features/home_feature/data/repos/actor_repo/actor_repo.dart';

part 'actor_social_media_state.dart';

class ActorSocialMediaCubit extends Cubit<ActorSocialMediaState> {
  ActorSocialMediaCubit(this.actorRepo) : super(ActorSocialMediaInitial());

  final ActorRepo actorRepo;

  Future<void> fetchActorSocialMedia({required int actorID}) async {
    emit(ActorSocialMediaLoading());
    var result = await actorRepo.fetchActorSocialMedia(actorID: actorID);

    result.fold((failure) {
      emit(
        ActorSocialMediaFailure(errorMessage: failure.errMessage),
      );
    }, (actorSocialMedia) {
      emit(
        ActorSocialMediaSuccess(actorSocialMedia: actorSocialMedia),
      );
    });
  }
}
