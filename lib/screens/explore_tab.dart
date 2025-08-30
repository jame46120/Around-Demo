import 'package:flutter/material.dart';
import 'category.dart';
import 'store_home_page.dart';
import '../widgets/service_grid.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'icon': Icons.restaurant, 'label': 'Chef'},
      {'icon': Icons.checkroom, 'label': 'Fashion'},
      {'icon': Icons.spa, 'label': 'Wellness'},
      {'icon': Icons.pets, 'label': 'Pet'},
      {'icon': Icons.class_, 'label': 'Class'},
    ];

    final services = [
      {
        'title': 'Home Cleaning',
        'subtitle': 'Sarah’s Cleaning Services',
        'image': 'assets/home_cleaning.jpg',
      },
      {
        'title': 'Handyman',
        'subtitle': 'Mike\'s Handyman\nSolutions',
        'image': 'assets/handyman.jpg',
      },
      {
        'title': 'Personal Training',
        'subtitle': 'Emily’s Pet Sitting',
        'image': 'assets/personal_training.jpg',
      },
      {
        'title': 'Pet Care',
        'subtitle': 'Loving Care Pets',
        'image': 'assets/pet_care.jpg',
      },
      {
        'title': 'Photography',
        'subtitle': 'Capture Moments\nPhotography',
        'image': 'assets/photography.jpg',
      },
      {
        'title': 'Event Planning',
        'subtitle': 'Celebration Events',
        'image': 'assets/event_planning.jpg',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              const SizedBox(height: 16),
              Row(
                children: const [
                  Icon(Icons.location_on_outlined, color: Colors.black54),
                  SizedBox(width: 8),
                  Text(
                    "Select Location",
                    style: TextStyle(
                      color: Color(0xFF4F9A81),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories.map((category) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Category(
                              categoryTitle: category['label'] as String,
                              services: services,
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: const Color(0xFFC7E8D9),
                              radius: 30,
                              child: Icon(
                                category['icon'] as IconData,
                                color: Colors.black,
                                size: 28,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              category['label'] as String,
                              style: const TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Trending Service",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 12),
              ServiceGrid(
                services: services,
                onTap: (service) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StoreHomePage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}