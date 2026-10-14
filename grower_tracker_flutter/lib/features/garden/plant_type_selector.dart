import 'package:flutter/material.dart';

class PlantTypeSelector extends StatefulWidget {
  const PlantTypeSelector({
    super.key,
    required this.initCropType,
    required this.onCropTypeChanged,
  });

  final (String, String) initCropType;
  final Function onCropTypeChanged;

  @override
  State<PlantTypeSelector> createState() => _PlantTypeSelectorState();
}

class _PlantTypeSelectorState extends State<PlantTypeSelector> {
  late (String, String) _selectedMenu;
  var plantItems = [
    ("🍅", "Tomato"),
    ("🥕", "Carrot"),
    ("🥒", "Cucumber"),
    ("🧄", "Garlic"),
    ("🧅", "Onion"),
  ];

  @override
  void initState() {
    super.initState();
    try {
      var selected = plantItems.firstWhere(
        (e) => e.$2 == widget.initCropType.$2,
      );
      _selectedMenu = selected;
    } catch (_) {
      throw Exception("Invalid Init Crop Type");
    }
  }

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
                  child: Text("${_selectedMenu.$1} ${_selectedMenu.$2}"),
                );
              },
          menuChildren: plantItems
              .map(
                (e) => MenuItemButton(
                  onPressed: () {
                    setState(() => _selectedMenu = e);
                    widget.onCropTypeChanged(e);
                  },
                  child: Text("${e.$1} ${e.$2}"),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
