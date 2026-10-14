import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PlantingDate extends StatefulWidget {
  const PlantingDate({super.key, required this.onDateChanged});

  final void Function(DateTime date) onDateChanged;
  @override
  State<PlantingDate> createState() => _PlantingDateState();
}

class _PlantingDateState extends State<PlantingDate> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    String formattedDate = DateFormat(
      'dd MMM yyyy HH:mm',
      'en_US',
    ).format(_selectedDate);
    var label = formattedDate;
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            "Sown on: ",
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: () => _pickDateTime(context),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
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
      widget.onDateChanged(
        DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        ),
      );
    });
  }
}
