
import 'package:equatable/equatable.dart';

sealed class ImagesPageEvent extends Equatable {
  const ImagesPageEvent();

  @override
  List<Object?> get props => [];
}

class LoadImages extends ImagesPageEvent {
  final String url;

  const LoadImages({required this.url});

  @override
  List<Object?> get props => [url];
}