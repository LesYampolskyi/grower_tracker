import 'package:flutter/material.dart';
import 'package:grower_tracker_client/grower_tracker_client.dart';
import 'package:grower_tracker_flutter/features/garden/plant_card.dart';
import 'package:grower_tracker_flutter/main.dart';

class GardenScreen extends StatefulWidget {
  const GardenScreen({super.key});

  @override
  State<GardenScreen> createState() => _GardenScreenState();
}

class _GardenScreenState extends State<GardenScreen> {
  var items = <PlantModel>[];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            var loaded = await client.garden.allByUser();
            setState(() {
              items = loaded;
            });
          },
          child: Text("Update"),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: items.length + 1,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.2,
            ),
            itemBuilder: (context, index) {
              return index == 0
                  ? PlantCard(
                      onTap: () {
                        Navigator.pushNamed(context, 'app/garden/add');
                      },
                      text: "Add",
                      textIcon: Icon(Icons.add, size: 40, color: Colors.green),
                    )
                  : PlantCard(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          'app/garden/edit',
                          arguments: items[index - 1],
                        );
                      },
                      text: items[index - 1].cropType,
                      textIcon: Text(
                        items[index - 1].icon,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
            },
          ),
        ),
      ],
    );
  }
}
