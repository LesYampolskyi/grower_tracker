import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PlantingDate extends StatefulWidget {
  const PlantingDate({super.key});

  @override
  State<PlantingDate> createState() => _PlantingDateState();
}

class _PlantingDateState extends State<PlantingDate> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat(
      'd MMMM yyyy',
    ).format(_selectedDate);
    var label = "$formattedDate:${_selectedTime.hour}:${_selectedTime.minute}";
    return Row(
      children: [
        Text("Sowing: "),
        OutlinedButton.icon(
          onPressed: () async => _pickDateTime(context),
          icon: const Icon(Icons.date_range_sharp),
          label: Text(label),
        ),
      ],
    );
  }

  Future<void> _pickDateTime(BuildContext context) async {
    final currentDate = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: currentDate.subtract(Duration(days: 365)),
      lastDate: currentDate.add(Duration(days: 365)),
    );

    if (pickedDate == null) return;

    // Right after the date, select the time
    if (!context.mounted) return;
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (pickedTime == null) return; // If time selection was cancelled

    setState(() {
      _selectedDate = pickedDate;
      _selectedTime = pickedTime;
    });
  }
}
