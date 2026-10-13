import 'package:flutter/material.dart';

class PlantTypeSelector extends StatefulWidget {
  const PlantTypeSelector({super.key});

  @override
  State<PlantTypeSelector> createState() => _PlantTypeSelectorState();
}

class _PlantTypeSelectorState extends State<PlantTypeSelector> {
  String _selectedMenu = 'Not selected';
  var plantItems = [
    "🍅 Tomato",
    "🥕 Carrot",
    "🥒 Cucumber",
    "🧄 Garlic",
    "🧅 Onion",
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Select a plant: "),
        MenuAnchor(
          builder:
              (
                BuildContext context,
                MenuController controller,
                Widget? child,
              ) {
                return OutlinedButton(
                  onPressed: () {
                    if (controller.isOpen) {
                      controller.close();
                    } else {
                      controller.open();
                    }
                  },
                  child: Text(_selectedMenu),
                );
              },
          menuChildren: plantItems
              .map(
                (e) => MenuItemButton(
                  onPressed: () => setState(() => _selectedMenu = e),
                  child: Text(e),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
