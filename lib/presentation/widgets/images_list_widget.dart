import 'package:flutter/material.dart';
import 'package:test_app/domain/entities/image_entity.dart';

class ImagesList extends StatelessWidget {
  final List<ImageEntity> images;
  const ImagesList({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.8,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        final image = images[index];
        return Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Image.network(image.url, fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  image.url,
                  style: const TextStyle(fontSize: 12, color: Colors.blue),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Text(
                  image.alt ?? 'No description',
                  style: const TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

