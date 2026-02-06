import 'package:dio/dio.dart';
import 'package:html/parser.dart' as html;
import 'package:test_app/data/models/image_model.dart';

abstract class Api {
  Future<List<ImageModel>> parseImages({required String url});
}

class ApiImpl implements Api {
  final dio = Dio();

  @override
  Future<List<ImageModel>> parseImages({
    required String url
  }) async {
    try {
      final response = await dio.get(url);
      final document = html.parse(response.data);

      final images = document.querySelectorAll('.product_pod img');


      return images
          .map(
            (img) => ImageModel.fromMap(
              img.attributes['src'] ?? '',
              img.attributes['alt'] ?? '',
            ),
          )
          .toSet().toList();
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response?.data);
        if (e.response?.statusCode == 404) return [];
      } else {
        print(e);
      }
    }
    return [];
  }
}
