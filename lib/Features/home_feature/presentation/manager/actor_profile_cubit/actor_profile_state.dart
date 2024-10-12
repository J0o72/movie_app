part of 'actor_profile_cubit.dart';

sealed class ActorProfileState extends Equatable {
  const ActorProfileState();

  @override
  List<Object> get props => [];
}

final class ActorProfileInitial extends ActorProfileState {}

final class ActorProfileSuccess extends ActorProfileState {
  final ActorModel? actorDetails;
  final ActorSocialMedia? actorSocialMedia;
  final List<ActorKnownFor>? actorCredits;

  const ActorProfileSuccess({
    this.actorDetails,
    this.actorSocialMedia,
    this.actorCredits,
  });
}

final class ActorProfileLoading extends ActorProfileState {}

final class ActorProfileFailure extends ActorProfileState {
  final String errorMessage;

  const ActorProfileFailure({required this.errorMessage});
}
