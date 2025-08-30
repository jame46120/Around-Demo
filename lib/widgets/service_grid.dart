// import 'package:flutter/material.dart';
//
// class ServiceGrid extends StatelessWidget {
//   final List<Map<String, String>> services;
//   final void Function(Map<String, String> service)? onTap;
//
//   const ServiceGrid({
//     Key? key,
//     required this.services,
//     this.onTap,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       itemCount: services.length,
//       shrinkWrap: true,
//       physics: BouncingScrollPhysics(), // or ClampingScrollPhysics()
//       padding: EdgeInsets.zero,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         mainAxisSpacing: 24,
//         crossAxisSpacing: 24,
//         childAspectRatio: 0.68,
//       ),
//       itemBuilder: (context, index) {
//         final service = services[index];
//         return GestureDetector(
//           onTap: () => onTap?.call(service),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(14),
//                 child: AspectRatio(
//                   aspectRatio: 1,
//                   child: Image.asset(
//                     service['image']!,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 12),
//               Text(
//                 service['title']!,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.w600,
//                   fontSize: 14,
//                 ),
//               ),
//               const SizedBox(height: 6),
//               Text(
//                 service['subtitle']!,
//                 style: const TextStyle(
//                   fontSize: 12,
//                   color: Color(0xFF4F9A81),
//                 ),
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';

class ServiceGrid extends StatelessWidget {
  final List<Map<String, String>> services;
  final void Function(Map<String, String> service)? onTap;

  const ServiceGrid({
    Key? key,
    required this.services,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: services.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // Let parent scroll
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
        childAspectRatio: 0.68,
      ),
      itemBuilder: (context, index) {
        final service = services[index];
        return GestureDetector(
          onTap: () => onTap?.call(service),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Service image
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    service['image']!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // White info box with text
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 6,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
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
                        color: Color(0xFF03A13E),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}