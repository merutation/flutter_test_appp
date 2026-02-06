import 'package:flutter/material.dart';

class UrlInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onPressed;
  final bool isButtonEnabled;

  const UrlInput({
    super.key,
    required this.controller,
    required this.onPressed,
    required this.isButtonEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        ElevatedButton(
          onPressed: isButtonEnabled ? onPressed : null,
          child: const Text('Load images'),
        ),
      ],
    );
  }
}
