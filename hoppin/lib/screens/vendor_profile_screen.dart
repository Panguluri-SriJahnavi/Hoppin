import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/app_state.dart';
import '../models/vendor.dart';
import '../data/mock_data.dart';
import '../theme/app_theme.dart';
import 'requesting_screen.dart';

class VendorProfileScreen extends StatelessWidget {
  const VendorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vendor = context.watch<AppState>().currentVendor!;
    final cat = categoryById(vendor.categoryId);

    return Scaffold(
      body: Column(children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150, padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(gradient: LinearGradient(colors: cat.gradient, begin: Alignment.topLeft, end: Alignment.bottomRight)),
                  child: SafeArea(
                    bottom: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(style: IconButton.styleFrom(backgroundColor: Colors.white70), onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back, size: 18)),
                        const Spacer(),
                        Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                          Container(width: 60, height: 60, decoration: BoxDecoration(color: AppColors.accent, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.white, width: 3)), child: Icon(vendor.icon, color: Colors.white)),
                          const SizedBox(width: 10),
                          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text(vendor.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18)),
                            Text(vendor.tagline, style: const TextStyle(color: Colors.white70, fontSize: 11.5)),
                          ]),
                        ]),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 14, 18, 0),
                  child: Wrap(spacing: 8, children: [
                    _chip('✅ ID Verified', AppColors.primaryDark, const Color(0xFFEEF2EA)),
                    _chip(vendor.pricing == PricingType.fixed ? 'Fixed price' : 'Quote after visit', vendor.pricing == PricingType.fixed ? AppColors.primaryDark : AppColors.accentDark, vendor.pricing == PricingType.fixed ? const Color(0xFFEEF2EA) : const Color(0xFFFFF4E0)),
                    _chip('${vendor.experience} experience', AppColors.primaryDark, const Color(0xFFEEF2EA)),
                  ]),
                ),
                if (vendor.pricing == PricingType.quote)
                  Container(
                    margin: const EdgeInsets.fromLTRB(18, 10, 18, 0), padding: const EdgeInsets.all(13),
                    decoration: BoxDecoration(color: const Color(0xFFFFF4E0), border: Border.all(color: const Color(0xFFF0DBA9)), borderRadius: BorderRadius.circular(12)),
                    child: Text("💡 This job needs an on-site look — ${vendor.name.split(' ').first} will inspect the issue first and send you an exact quote before any payment is taken.", style: const TextStyle(fontSize: 11.5, color: AppColors.accentDark, height: 1.4)),
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 14, 18, 0),
                  child: Row(children: [_stat('${vendor.rating} ★', 'Rating'), _stat('${vendor.reviews}', 'Jobs done'), _stat(vendor.arrival, 'Avg. arrival')]),
                ),
                const Padding(padding: EdgeInsets.fromLTRB(18, 16, 18, 8), child: Text('REVIEWS & SUGGESTIONS', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.inkSoft))),
                _review('Meera S.', '★★★★★', 'Great work, explained everything clearly. Would book again.'),
                _review('Arjun P.', '★★★★☆', 'On time and professional.'),
                _review('Suggested for you', 'Similar', "Customers who booked this category also trusted ${vendor.name.split(' ').first} for quality work."),
                const SizedBox(height: 90),
              ],
            ),
          ),
        ),
      ]),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(18, 14, 18, 18),
        decoration: const BoxDecoration(color: AppColors.surface, border: Border(top: BorderSide(color: AppColors.border))),
        child: SafeArea(
          top: false,
          child: Row(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(vendor.pricing == PricingType.fixed ? '₹${vendor.price.toStringAsFixed(0)}' : 'From ₹${vendor.priceFrom.toStringAsFixed(0)}', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 16)),
              Text(vendor.pricing == PricingType.fixed ? 'per ${vendor.unit}'.toUpperCase() : 'ESTIMATE', style: const TextStyle(fontSize: 9.5, color: AppColors.inkSoft, fontWeight: FontWeight.w700)),
            ]),
            const SizedBox(width: 14),
            Expanded(child: ElevatedButton(onPressed: () {
              context.read<AppState>().startBooking(vendor);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const RequestingScreen()));
            }, child: const Text('Book now'))),
          ]),
        ),
      ),
    );
  }

  Widget _chip(String label, Color fg, Color bg) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(100)),
        child: Text(label, style: TextStyle(color: fg, fontSize: 11, fontWeight: FontWeight.w700)),
      );

  Widget _stat(String value, String label) => Expanded(
        child: Container(
          margin: const EdgeInsets.only(right: 8), padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: AppColors.surface, border: Border.all(color: AppColors.border), borderRadius: BorderRadius.circular(14)),
          child: Column(children: [
            Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            Text(label.toUpperCase(), style: const TextStyle(fontSize: 9, color: AppColors.inkSoft, fontWeight: FontWeight.w700)),
          ]),
        ),
      );

  Widget _review(String author, String stars, String text) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.border))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(author, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12.5)),
            Text(stars, style: const TextStyle(color: AppColors.accentDark, fontSize: 11)),
          ]),
          const SizedBox(height: 4),
          Text(text, style: const TextStyle(fontSize: 12, color: AppColors.inkSoft, height: 1.5)),
        ]),
      );
}
