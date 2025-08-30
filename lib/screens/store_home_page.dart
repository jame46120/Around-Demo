import 'package:flutter/material.dart';
import '../widgets/build_star_row.dart';
import '../widgets/rating_summary.dart';

class StoreHomePage extends StatefulWidget {
  const StoreHomePage({super.key});

  @override
  State<StoreHomePage> createState() => _StoreHomePageState();
}

class _StoreHomePageState extends State<StoreHomePage> {
  int selectedTabIndex = 0; // 0 = Store Home, 1 = Services

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header with Back Button
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back),
                  ),

                ],
              ),
            ),

            // Tab Toggle
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => selectedTabIndex = 0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: selectedTabIndex == 0
                                  ? const Color(0xFF4F9A81)
                                  : const Color(0xFFE5E8EA),
                              width: 3,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Store Home',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Plus Jakarta Sans',
                              color: selectedTabIndex == 0
                                  ? const Color(0xFF0C1911)
                                  : Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => selectedTabIndex = 1),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: selectedTabIndex == 1
                                  ? const Color(0xFF4F9A81)
                                  : const Color(0xFFE5E8EA),
                              width: 3,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Services',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Plus Jakarta Sans',
                              color: selectedTabIndex == 1
                                  ? const Color(0xFF0C1911)
                                  : Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                child: selectedTabIndex == 0 ? _buildStoreHome() : _buildServiceTab(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStoreHome() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Banner
        Container(
          width: double.infinity,
          height: 464,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://placehold.co/390x464"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.play_arrow, color: Colors.white),
            ),
          ),
        ),

        // Profile
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage("https://placehold.co/90x90"),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Olivia Bennett',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Plus Jakarta Sans',
                    ),
                  ),
                  Text(
                    'Interior Designer',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF51936B),
                      fontFamily: 'Plus Jakarta Sans',
                    ),
                  ),
                  Text(
                    '4.9 (120 reviews)',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF51936B),
                      fontFamily: 'Plus Jakarta Sans',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // About
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Olivia Bennett is a highly skilled interior designer with over 10 years of experience. She specializes in creating beautiful and functional spaces that reflect her clients' unique styles and needs. Her expertise includes space planning, color coordination, furniture selection, and custom design solutions. Olivia is committed to delivering exceptional results and ensuring client satisfaction.",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF0C1911),
              fontFamily: 'Plus Jakarta Sans',
            ),
          ),
        ),

        // Reviews
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 20, 16, 8),
          child: Text(
            'Reviews',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0C1911),
              fontFamily: 'Plus Jakarta Sans',
            ),
          ),
        ),

        const SizedBox(height: 16),
        const RatingSummary(),
        const SizedBox(height: 24),

        // Sample Review
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage("https://placehold.co/100x100"),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Ethan Carter",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      buildStarRow(5),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Olivia transformed my living room into a stunning and functional space. Her attention to detail and creative ideas exceeded my expectations. I highly recommend her services!',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Plus Jakarta Sans',
                ),
              ),
            ],
          ),
        ),

        // Book Now Button
        Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFCDF2E7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            child: const Text(
              'Book Now',
              style: TextStyle(
                color: Color(0xFF0C1911),
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontFamily: 'Plus Jakarta Sans',
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildServiceTab() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        'Service List (Placeholder)', // Replace with actual services widget
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}