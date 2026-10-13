import 'package:flutter/material.dart';

class PlantNameField extends StatefulWidget {
  const PlantNameField({super.key});

  @override
  State<PlantNameField> createState() => _PlantNameFieldState();
}

class _PlantNameFieldState extends State<PlantNameField> {
  final TextEditingController _textController = TextEditingController();
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      decoration: InputDecoration(
        labelText: 'Enter A Plant Label',
        hintText: 'Cherry',
        prefixIcon: const Icon(Icons.yard),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
