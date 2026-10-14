import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CultivationField extends StatelessWidget {
  const CultivationField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],

      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Cultivation days',
        hintText: 'Example: 42',
      ),
    );
  }
}
