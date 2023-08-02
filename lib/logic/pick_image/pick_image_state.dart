part of 'pick_image_cubit.dart';

@immutable
abstract class PickImageState extends Equatable {}

class PickImageInitial extends PickImageState {
  @override
  List<Object?> get props => [];
}

class PickImageLoading extends PickImageState {
  @override
  List<Object?> get props => [];
}

class PickImageSuccess extends PickImageState {
  @override
  List<Object?> get props => [];
}

class PickImageError extends PickImageState {
  PickImageError({required this.error});
  final String error;
  @override
  List<Object> get props => [error];
}
