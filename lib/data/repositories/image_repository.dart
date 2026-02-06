import 'package:test_app/data/datasources/api.dart';
import 'package:test_app/domain/entities/image_entity.dart';
import 'package:test_app/domain/repositories/image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  final Api api;

  ImageRepositoryImpl({required this.api});

  @override
  Future<List<ImageEntity>> parseImagesFromPage(String pageUrl) async {
    final fetchedImages = await api.parseImages(url: pageUrl);
    return fetchedImages.map((model) => model.toEntity()).toList();
  }
}
