import 'package:flutter/material.dart';

class PlantNameField extends StatelessWidget {
  const PlantNameField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
