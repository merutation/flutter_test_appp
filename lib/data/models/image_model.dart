
import 'package:test_app/domain/entities/image_entity.dart';

class ImageModel {
  final String url;
  final String? alt;

  const ImageModel({required this.url, this.alt});

  factory ImageModel.fromMap(String src, String alt) {
    const baseUrl = 'https://books.toscrape.com/';
    final absoluteUrl = Uri.parse(baseUrl).resolve(src).toString();

    return ImageModel(url: absoluteUrl, alt: alt);
  }

  Map<String, dynamic> toMap() => {'url': url, 'alt': alt};


  ImageEntity toEntity() {
    return ImageEntity(url: url, alt: alt);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ImageModel && url == other.url;
  @override
  int get hashCode => url.hashCode;
}
