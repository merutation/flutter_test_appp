import 'package:equatable/equatable.dart';
import 'package:test_app/domain/entities/image_entity.dart';

abstract class ImagesPageState extends Equatable {
  const ImagesPageState();

  @override
  List<Object?> get props => [];
}

class ImagesInitial extends ImagesPageState {}

class ImagesLoading extends ImagesPageState {}

class ImagesLoaded extends ImagesPageState {
  final List<ImageEntity> images;

  const ImagesLoaded(this.images);

  @override
  List<Object?> get props => [images];
}

class ImagesError extends ImagesPageState {
  final String message;

  const ImagesError(this.message);

  @override
  List<Object?> get props => [message];
}
