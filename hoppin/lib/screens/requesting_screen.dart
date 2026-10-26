import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/app_state.dart';
import '../models/vendor.dart';
import '../models/booking.dart';
import '../theme/app_theme.dart';
import 'quote_screen.dart';
import 'tracking_screen.dart';

class RequestingScreen extends StatefulWidget {
  const RequestingScreen({super.key});
  @override
  State<RequestingScreen> createState() => _RequestingScreenState();
}

class _RequestingScreenState extends State<RequestingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), _onAccepted);
  }

  void _onAccepted() {
    if (!mounted) return;
    final state = context.read<AppState>();
    final vendor = state.currentVendor!;
    if (vendor.pricing == PricingType.quote) {
      final quote = QuoteBreakdown(inspectionCharge: vendor.priceFrom, estimatedParts: (vendor.priceFrom * 0.7).roundToDouble());
      state.vendorAccepts(quote: quote);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const QuoteScreen()));
    } else {
      state.vendorAccepts();
      state.beginTracking();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const TrackingScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final vendor = context.watch<AppState>().currentVendor!;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(width: 64, height: 64, child: CircularProgressIndicator(strokeWidth: 5, color: AppColors.accent)),
            const SizedBox(height: 22),
            Text('Requesting ${vendor.name}…', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
            const SizedBox(height: 6),
            const Text('Waiting for the vendor to accept your booking request.', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: AppColors.inkSoft)),
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(color: AppColors.surface, border: Border.all(color: AppColors.border), borderRadius: BorderRadius.circular(14)),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(vendor.icon, size: 20, color: AppColors.primary),
                const SizedBox(width: 10),
                Text(vendor.tagline, style: const TextStyle(fontSize: 12)),
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
