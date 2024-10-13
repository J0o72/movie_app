part of 'actor_social_media_cubit.dart';

sealed class ActorSocialMediaState extends Equatable {
  const ActorSocialMediaState();

  @override
  List<Object> get props => [];
}

final class ActorSocialMediaInitial extends ActorSocialMediaState {}

final class ActorSocialMediaSuccess extends ActorSocialMediaState {
  final ActorSocialMedia actorSocialMedia;

  const ActorSocialMediaSuccess({required this.actorSocialMedia});
}

final class ActorSocialMediaLoading extends ActorSocialMediaState {}

final class ActorSocialMediaFailure extends ActorSocialMediaState {
  final String errorMessage;

  const ActorSocialMediaFailure({required this.errorMessage});
}
