import 'package:flutter/material.dart';

enum PricingType { fixed, quote }
enum Gender { male, female }

class ServiceCategory {
  final String id;
  final String label;
  final IconData icon;
  final List<Color> gradient;
  const ServiceCategory({required this.id, required this.label, required this.icon, required this.gradient});
}

class Vendor {
  final int id;
  final String name;
  final String categoryId;
  final IconData icon;
  final double distanceKm;
  final double rating;
  final int reviews;
  final PricingType pricing;
  final double price;
  final double priceFrom;
  final String unit;
  final String availability;
  final String tagline;
  final String experience;
  final String arrival;
  final bool verified;
  final Gender gender;

  const Vendor({
    required this.id, required this.name, required this.categoryId, required this.icon,
    required this.distanceKm, required this.rating, required this.reviews, required this.pricing,
    this.price = 0, this.priceFrom = 0, required this.unit, required this.availability,
    required this.tagline, required this.experience, required this.arrival,
    required this.verified, required this.gender,
  });

  bool get isAvailableNow => availability.toLowerCase().contains('now');
  double get displayBasePrice => pricing == PricingType.fixed ? price : priceFrom;
}
