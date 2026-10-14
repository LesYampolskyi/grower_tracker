import 'package:flutter/material.dart';

class PlantCard extends StatelessWidget {
  const PlantCard({
    super.key,
    required this.onTap,
    required this.text,
    required this.textIcon,
  });

  final Function() onTap;
  final String text;
  final Widget textIcon;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: const Color.fromARGB(255, 219, 222, 227),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(
          12,
        ),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textIcon,
              const SizedBox(height: 8),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
