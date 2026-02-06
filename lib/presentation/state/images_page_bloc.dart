import 'package:bloc/bloc.dart';
import 'package:test_app/domain/usecases/parse_images.dart';
import 'images_page_event.dart';
import 'images_page_state.dart';
import 'package:test_app/domain/entities/image_entity.dart';

class ImagesBloc extends Bloc<ImagesPageEvent, ImagesPageState> {
  final ParseImagesFromPage parseImagesFromPage;

  ImagesBloc({required this.parseImagesFromPage}) : super(ImagesInitial()) {
    on<LoadImages>(_onLoadImages);
  }

  Future<void> _onLoadImages(
    LoadImages event,
    Emitter<ImagesPageState> emit,
  ) async {

    final url = event.url.trim();

    if (url.isEmpty || Uri.tryParse(url)?.hasAbsolutePath != true) {
      emit(const ImagesError('write the valid url'));
      return;
    }

    emit(ImagesLoading());

    try {
      final List<ImageEntity> images = await parseImagesFromPage(event.url);
      if (images.isEmpty) {
        emit(ImagesError('Images could not be loaded'));
      } else {
        emit(ImagesLoaded(images));
      }
    } catch (e) {
      emit(ImagesError(e.toString()));
    }
  }
}
