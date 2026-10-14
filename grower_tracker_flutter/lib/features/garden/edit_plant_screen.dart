import 'package:flutter/material.dart';
import 'package:grower_tracker_client/grower_tracker_client.dart';
import 'package:grower_tracker_flutter/config/snakbar_custom.dart';
import 'package:grower_tracker_flutter/features/garden/action_button.dart';
import 'package:grower_tracker_flutter/features/garden/cultivation_field.dart';
import 'package:grower_tracker_flutter/features/garden/plant_name_field.dart';
import 'package:grower_tracker_flutter/features/garden/plant_type_selector.dart';
import 'package:grower_tracker_flutter/features/garden/planting_date.dart';
import 'package:grower_tracker_flutter/main.dart';

class EditPlantScreen extends StatefulWidget {
  const EditPlantScreen({super.key});

  @override
  State<EditPlantScreen> createState() => _EditPlantScreenState();
}

class _EditPlantScreenState extends State<EditPlantScreen> {
  late (String, String) cropType;
  var cultivationDays = 0;
  var plantedAt = DateTime.now();

  late TextEditingController daysController;
  late TextEditingController labeController;
  late PlantModel plant;
  late ColorScheme colors;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    plant = ModalRoute.of(context)!.settings.arguments as PlantModel;
    labeController = TextEditingController(text: plant.name);
    daysController = TextEditingController(
      text: plant.cultivationDays.toString(),
    );
    cropType = (plant.icon, plant.cropType);
  }

  @override
  void dispose() {
    daysController.dispose();
    labeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: Text(
          "Edit the plant",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            padding: const EdgeInsets.all(18.0),
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  spacing: 20,
                  children: [
                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerRight,
                      child: Text(
                        "TelegramId: ${plant.telegramId.toString()}",
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerRight,
                      child: Text(
                        "AuthId: ${plant.authUserId.toString()}",
                      ),
                    ),

                    PlantTypeSelector(
                      initCropType: cropType,
                      onCropTypeChanged: ((String, String) value) {
                        cropType = value;
                      },
                    ),
                    PlantingDate(
                      onDateChanged: (date) {
                        plantedAt = date;
                      },
                    ),
                    PlantNameField(
                      controller: labeController,
                    ),
                    CultivationField(controller: daysController),
                    ActionButton(
                      onPressed: () async => await update(context),
                      label: "Edit",
                    ),
                    ActionButton(
                      onPressed: () async => await delete(context),
                      label: "Delete",
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> delete(BuildContext context) async {
    var result = await _confirmDelete(context);
    if (result == null || !result) return;
    try {
      await client.garden.delete(plant);
      if (!context.mounted) return;
      context.showSnackBar(
        message: 'Delete success',
        backgroundColor: colors.primaryContainer,
        foregroundColor: colors.onPrimaryContainer,
      );
    } catch (_) {
      if (!context.mounted) return;
      context.showSnackBar(
        message: 'Delete error',
        backgroundColor: colors.errorContainer,
        foregroundColor: colors.onErrorContainer,
      );
    } finally {
      if (!context.mounted) return;
      Navigator.of(context).pop();
    }
  }

  Future<void> update(BuildContext context) async {
    var days = daysController.text.isEmpty ? 0 : int.parse(daysController.text);
    var updated = plant.copyWith(
      cultivationDays: days,
      cropType: cropType.$2,
      plantedAt: plantedAt,
      icon: cropType.$1,
      name: labeController.text.trim(),
    );

    try {
      await client.garden.edit(updated);
      if (!context.mounted) return;
      context.showSnackBar(
        message: 'Plant Updated',
        backgroundColor: colors.primaryContainer,
        foregroundColor: colors.onPrimaryContainer,
      );
    } catch (e) {
      context.showSnackBar(
        message: 'Error. Not updated',
        backgroundColor: colors.errorContainer,
        foregroundColor: colors.onErrorContainer,
      );
    } finally {
      Navigator.of(context).pop();
    }
  }
}

Future<bool?> _confirmDelete(BuildContext context) async {
  final bool? confirm = await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirm Deletion'),
        content: const Text('Are you sure you want to delete this plant?'),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text('Yes, delete'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );

  return confirm;
}
