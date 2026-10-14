import 'package:flutter/material.dart';
import 'package:grower_tracker_client/grower_tracker_client.dart';
import 'package:grower_tracker_flutter/config/snakbar_custom.dart';
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
      appBar: AppBar(
        title: Text("Add a plant"),
      ),
      body: Container(
        color: Colors.purple,
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
              ElevatedButton(
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
                child: const Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
