import 'package:flutter/material.dart';
import 'package:grower_tracker_flutter/features/garden/cultivation_field.dart';
import 'package:grower_tracker_flutter/features/garden/plant_name_field.dart';
import 'package:grower_tracker_flutter/features/garden/plant_type_selector.dart';
import 'package:grower_tracker_flutter/features/garden/planting_date.dart';

class AddPlantScreen extends StatefulWidget {
  const AddPlantScreen({super.key});

  @override
  State<AddPlantScreen> createState() => _AddPlantScreenState();
}

class _AddPlantScreenState extends State<AddPlantScreen> {
  @override
  Widget build(BuildContext context) {
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
              PlantTypeSelector(),
              PlantingDate(),
              PlantNameField(),
              CultivationField(),
              ElevatedButton(
                onPressed: () {
                  print("Add was pressed!");
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
