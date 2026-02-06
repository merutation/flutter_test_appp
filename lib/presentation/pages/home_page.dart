import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/presentation/state/images_page_bloc.dart';
import 'package:test_app/presentation/state/images_page_event.dart';
import 'package:test_app/presentation/state/images_page_state.dart';
import 'package:test_app/presentation/widgets/images_list_widget.dart';
import 'package:test_app/presentation/widgets/url_input_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        title: const Text('Parsed Images'),
      ),
      body: const Content(),
    );
  }
}

class Content extends StatefulWidget {
  const Content({super.key});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final myController = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    myController.addListener(() {
      setState(() {
        isButtonEnabled = myController.text.isNotEmpty;
      });
    });
  }

  void _loadImages() {
    final url = myController.text;
    context.read<ImagesBloc>().add(LoadImages(url: url));
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          UrlInput(
            controller: myController,
            onPressed: _loadImages,
            isButtonEnabled: isButtonEnabled,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: BlocBuilder<ImagesBloc, ImagesPageState>(
              builder: (context, state) {
                if (state is ImagesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ImagesLoaded) {
                  return ImagesList(images: state.images);
                } else if (state is ImagesError) {
                  return Center(child: Text('Error: ${state.message}'));
                }
                return const Center(
                  child: Text('Enter a URL and press load images'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
