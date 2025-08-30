import 'package:flutter/material.dart';
import 'category.dart';
import 'store_home_page.dart';

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

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
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
          // const SizedBox(height: 12),
          // TextField(
          //   decoration: InputDecoration(
          //     hintText: "Search for services",
          //     prefixIcon: const Icon(Icons.search),
          //     contentPadding: const EdgeInsets.symmetric(vertical: 0),
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(12),
          //       borderSide: const BorderSide(color: Color(0xFFC7E8D9)),
          //     ),
          //     enabledBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(12),
          //       borderSide: const BorderSide(color: Color(0xFFC7E8D9)),
          //     ),
          //   ),
          // ),
          const SizedBox(height: 20),
          const Text("Categories", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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
                          services: services, // filter if needed
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
          const Text("Trending Service", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: services.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 24,
              crossAxisSpacing: 24,
              childAspectRatio: 0.68,
            ),
            itemBuilder: (context, index) {
              final service = services[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoreHomePage(), // Make sure this class exists
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.asset(
                          service['image']!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    service['title']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    service['subtitle']!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF4F9A81),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}