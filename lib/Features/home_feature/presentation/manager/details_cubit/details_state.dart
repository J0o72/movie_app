part of 'details_cubit.dart';

sealed class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object> get props => [];
}

final class DetailsInitial extends DetailsState {}

final class DetailsSuccess extends DetailsState {
  final DetailsModel? detailsModel;
  final TvShowsDetailsModel? tvShowsDetailsModel;

  const DetailsSuccess({this.tvShowsDetailsModel, this.detailsModel});
}

final class DetailsLoading extends DetailsState {}

final class DetailsFailure extends DetailsState {
  final String errorMessage;

  const DetailsFailure({required this.errorMessage});
}
