import 'package:flutter/material.dart';
import '../models/vendor.dart';
import '../data/mock_data.dart';
import '../theme/app_theme.dart';

class VendorCard extends StatelessWidget {
  final Vendor vendor;
  final VoidCallback onTap;
  const VendorCard({super.key, required this.vendor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final cat = categoryById(vendor.categoryId);
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: AppColors.surface, border: Border.all(color: AppColors.border), borderRadius: BorderRadius.circular(16)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 56, height: 56,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), gradient: LinearGradient(colors: cat.gradient, begin: Alignment.topLeft, end: Alignment.bottomRight)),
                  child: Icon(vendor.icon, color: Colors.white, size: 22),
                ),
                if (vendor.isAvailableNow)
                  Positioned(right: -2, bottom: -2, child: Container(width: 12, height: 12, decoration: BoxDecoration(color: AppColors.success, shape: BoxShape.circle, border: Border.all(color: AppColors.surface, width: 2)))),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Flexible(child: Text(vendor.name, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13.5), overflow: TextOverflow.ellipsis)),
                    if (vendor.verified) ...[const SizedBox(width: 4), const Icon(Icons.verified, size: 14, color: AppColors.primary)],
                  ]),
                  const SizedBox(height: 2),
                  Text('${vendor.distanceKm} km away · ${vendor.availability}', style: const TextStyle(fontSize: 11.5, color: AppColors.inkSoft)),
                  const SizedBox(height: 6),
                  Row(children: [
                    const Icon(Icons.star, size: 13, color: AppColors.accentDark),
                    const SizedBox(width: 3),
                    Text('${vendor.rating}', style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.w700, color: AppColors.accentDark)),
                    const SizedBox(width: 4),
                    Text('(${vendor.reviews} reviews)', style: const TextStyle(fontSize: 11.5, color: AppColors.inkSoft)),
                  ]),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  vendor.pricing == PricingType.fixed ? '₹${vendor.price.toStringAsFixed(0)}' : 'From ₹${vendor.priceFrom.toStringAsFixed(0)}',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12.5, color: vendor.pricing == PricingType.fixed ? AppColors.primaryDark : AppColors.accentDark),
                ),
                Text(vendor.pricing == PricingType.fixed ? 'per ${vendor.unit}' : 'after visit', style: const TextStyle(fontSize: 9, color: AppColors.inkSoft, fontWeight: FontWeight.w600)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
