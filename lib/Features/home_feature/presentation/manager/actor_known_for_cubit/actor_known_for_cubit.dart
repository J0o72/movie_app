import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/models/actor_model/actor_known_for.dart';
import 'package:movie_app/Features/home_feature/data/repos/actor_repo/actor_repo.dart';

part 'actor_known_for_state.dart';

class ActorKnownForCubit extends Cubit<ActorKnownForState> {
  ActorKnownForCubit(this.actorRepo) : super(ActorKnownForInitial());

  final ActorRepo actorRepo;

  Future<void> fetchActorCredits({required String actorID}) async {
    emit(ActorKnownForLLoading());
    var result = await actorRepo.fetchActorCredits(actorID: actorID);

    result.fold((failure) {
      emit(
        ActorKnownForFailure(errorMessage: failure.errMessage),
      );
    }, (actorCredits) {
      emit(
        ActorKnownForSuccess(actorCredits: actorCredits),
      );
    });
  }
}
