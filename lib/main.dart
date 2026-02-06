import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/data/datasources/api.dart';
import 'package:test_app/data/repositories/image_repository.dart';
import 'package:test_app/domain/usecases/parse_images.dart';
import 'package:test_app/presentation/pages/home_page.dart';
import 'package:test_app/presentation/state/images_page_bloc.dart';

void main() {
  final api = ApiImpl();
  final repository = ImageRepositoryImpl(api: api);
  final useCase = ParseImagesFromPage(repository);

  runApp(
    BlocProvider(
      create: (_) => ImagesBloc(parseImagesFromPage: useCase),
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  HomePage()
    );
  }
}

