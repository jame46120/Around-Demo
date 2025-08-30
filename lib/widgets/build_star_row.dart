import 'package:flutter/material.dart';
Widget buildStarRow(double rating, {double size = 18, Color color = const Color(0xFF4F9A81)}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: List.generate(5, (index) {
      return Icon(
        index < rating ? Icons.star : Icons.star_border,
        color: color,
        size: size,
      );
    }),
  );
}