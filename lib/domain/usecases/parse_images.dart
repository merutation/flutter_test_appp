import 'package:test_app/domain/entities/image_entity.dart';
import 'package:test_app/domain/repositories/image_repository.dart';

class ParseImagesFromPage {
  final ImageRepository imageRepository;

  ParseImagesFromPage(this.imageRepository);

  Future<List<ImageEntity>> call(String pageUrl) async {
    return await imageRepository.parseImagesFromPage(pageUrl);
  }
}
