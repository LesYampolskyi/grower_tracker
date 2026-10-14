import 'package:flutter/material.dart';
import 'package:grower_tracker_client/grower_tracker_client.dart';
import 'package:grower_tracker_flutter/config/snakbar_custom.dart';
import 'package:grower_tracker_flutter/features/garden/action_button.dart';
import 'package:grower_tracker_flutter/features/garden/cultivation_field.dart';
import 'package:grower_tracker_flutter/features/garden/plant_name_field.dart';
import 'package:grower_tracker_flutter/features/garden/plant_type_selector.dart';
import 'package:grower_tracker_flutter/features/garden/planting_date.dart';
import 'package:grower_tracker_flutter/main.dart';

class AddPlantScreen extends StatefulWidget {
  const AddPlantScreen({super.key});

  @override
  State<AddPlantScreen> createState() => _AddPlantScreenState();
}

class _AddPlantScreenState extends State<AddPlantScreen> {
  var cropType = ("🥕", "Carrot");
  var cultivationDays = 0;
  var plantedAt = DateTime.now();

  var daysController = TextEditingController();
  var labeController = TextEditingController();

  @override
  void dispose() {
    daysController.dispose();
    labeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: Text(
          "Add a plant",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(12.0),

          child: Container(
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
            padding: const EdgeInsets.all(18.0),

            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  spacing: 20,
                  children: [
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
                      onPressed: () async {
                        var plant = PlantModel(
                          cultivationDays: daysController.text.isEmpty
                              ? 0
                              : int.parse(daysController.text),
                          cropType: cropType.$2,
                          plantedAt: plantedAt,
                          icon: cropType.$1,
                          name: labeController.text,
                        );
                        await client.garden.create(plant);

                        if (!context.mounted) return;
                        context.showSnackBar(
                          message: 'Plant Created',
                          backgroundColor: colors.primaryContainer,
                          foregroundColor: colors.onPrimaryContainer,
                        );
                        Navigator.of(context).pop();
                      },
                      label: "Add",
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
}
