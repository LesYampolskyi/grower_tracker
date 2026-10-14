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
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Expanded(
          child: Text(
            "Select a plant:",
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: MenuAnchor(
            builder:
                (
                  BuildContext context,
                  MenuController controller,
                  Widget? child,
                ) {
                  return OutlinedButton.icon(
                    onPressed: () {
                      if (controller.isOpen) {
                        controller.close();
                      } else {
                        controller.open();
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    icon: Text(
                      "${_selectedMenu.$1} ${_selectedMenu.$2}",
                    ),
                    label: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.grey,
                    ),
                  );
                },
            menuChildren: plantItems
                .map(
                  (e) => MenuItemButton(
                    onPressed: () {
                      setState(() => _selectedMenu = e);
                      widget.onCropTypeChanged(e);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 12.0,
                      ),
                      child: Text("${e.$1} ${e.$2}"),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
