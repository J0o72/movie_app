part of 'actor_known_for_cubit.dart';

sealed class ActorKnownForState extends Equatable {
  const ActorKnownForState();

  @override
  List<Object> get props => [];
}

final class ActorKnownForInitial extends ActorKnownForState {}

final class ActorKnownForSuccess extends ActorKnownForState {
  final List<ActorKnownFor> actorCredits;

  const ActorKnownForSuccess({required this.actorCredits});
}

final class ActorKnownForLLoading extends ActorKnownForState {}

final class ActorKnownForFailure extends ActorKnownForState {
  final String errorMessage;

  const ActorKnownForFailure({required this.errorMessage});
}
