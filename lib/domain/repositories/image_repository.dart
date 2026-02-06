import 'package:test_app/domain/entities/image_entity.dart';

abstract class ImageRepository {
  Future<List<ImageEntity>> parseImagesFromPage(String pageUrl);
}
