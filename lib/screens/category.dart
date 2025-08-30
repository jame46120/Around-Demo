import 'package:flutter/material.dart';
import '../widgets/service_grid.dart';
import 'store_home_page.dart';

class Category extends StatelessWidget {
  final String categoryTitle;
  final List<Map<String, String>> services;

  const Category({
    super.key,
    required this.categoryTitle,
    required this.services,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar with back arrow and title
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.black87,
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 4),
                  // Text(
                  //   categoryTitle,
                  //   style: const TextStyle(
                  //     fontSize: 18,
                  //     fontWeight: FontWeight.bold,
                  //     color: Colors.black87,
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(height: 12),

              // Section Title
              Text(
                categoryTitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),

              // Grid content
              Expanded(
                child: ServiceGrid(
                  services: services,
                  onTap: (service) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StoreHomePage(), // or pass the data if needed
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}