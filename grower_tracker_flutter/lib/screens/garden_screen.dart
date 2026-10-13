import 'package:flutter/material.dart';

class GardenScreen extends StatelessWidget {
  GardenScreen({super.key});

  final items = [
    ("🍅", "Tomato"),
    ("🥕", "Carrot"),
    ("🥒", "Cucumber"),
    ("🧄", "Garlic"),
    ("🧅", "Onion"),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                  ? Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, 'app/garden/detail');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add, size: 40, color: Colors.green),
                              const SizedBox(height: 8),
                              Text(
                                "Add",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              items[index - 1].$1,
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              items[index - 1].$2,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
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
