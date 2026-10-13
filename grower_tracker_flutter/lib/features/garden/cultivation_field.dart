import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CultivationField extends StatefulWidget {
  const CultivationField({super.key});

  @override
  State<CultivationField> createState() => _CultivationFieldState();
}

class _CultivationFieldState extends State<CultivationField> {
  final TextEditingController _daysController = TextEditingController();
  int _inputValue = 0;

  @override
  void dispose() {
    _daysController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _daysController,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],

      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Cultivation days',
        hintText: 'Example: 42',
      ),

      onChanged: (value) {
        setState(() {
          _inputValue = int.tryParse(value) ?? 0;
        });
      },
    );
  }
}
