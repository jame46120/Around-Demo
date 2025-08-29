import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Service Explore App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'PlusJakartaSans',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const ExplorePage(),
    );
  }
}

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

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
      backgroundColor: const Color(0xFFEDEEFF),
      body: SafeArea(
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
            const SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                hintText: "Search for services",
                prefixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFC7E8D9)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFC7E8D9)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text("Categories", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: const Color(0xFFC7E8D9),
                          radius: 30,
                          child: Icon(category['icon'] as IconData, color: Colors.black, size: 28),
                        ),
                        const SizedBox(height: 6),
                        Text(category['label'] as String, style: const TextStyle(fontSize: 13)),
                      ],
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
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.85,
              ),
              itemBuilder: (context, index) {
                final service = services[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(14),
                            topRight: Radius.circular(14),
                          ),
                          child: Image.asset(
                            service['image']!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              service['title']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              service['subtitle']!,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF4F9A81),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF4F9A81),
        unselectedItemColor: Colors.black54,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.travel_explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'My Booking'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Account'),
        ],
      ),
    );
  }
}