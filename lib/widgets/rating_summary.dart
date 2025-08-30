import 'package:flutter/material.dart';


class RatingSummary extends StatelessWidget {
  const RatingSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16), // <-- consistent left-right padding
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Overall rating
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '4.9',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0C1911),
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: List.generate(5, (index) {
                  return const Icon(Icons.star, size: 16, color: Color(0xFF4F9A81));
                }),
              ),
              const SizedBox(height: 4),
              const Text(
                '120 reviews',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
            ],
          ),

          const SizedBox(width: 24),

          // Rating bars
          Expanded(
            child: Column(
              children: _ratingData.entries.map((entry) {
                final star = entry.key;
                final percent = entry.value;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 12,
                        child: Text(
                          '$star',
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: percent / 100,
                          backgroundColor: const Color(0xFFE0F1EA),
                          valueColor: const AlwaysStoppedAnimation(Color(0xFF4F9A81)),
                          minHeight: 6,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '$percent%',
                        style: const TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// Dummy rating data
final Map<int, int> _ratingData = {
  5: 80,
  4: 15,
  3: 3,
  2: 1,
  1: 1,
};