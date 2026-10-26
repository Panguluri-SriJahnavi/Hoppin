import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/app_state.dart';
import '../data/mock_data.dart';
import '../theme/app_theme.dart';
import 'bookings_screen.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vendor = context.watch<AppState>().currentVendor!;
    final categoryLabel = categoryById(vendor.categoryId).label.toLowerCase();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(width: 74, height: 74, decoration: const BoxDecoration(color: AppColors.success, shape: BoxShape.circle), child: const Icon(Icons.check, color: Colors.white, size: 34)),
            const SizedBox(height: 18),
            const Text('Payment successful', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Text("${vendor.name} has been notified. You'll get a receipt and can rate the $categoryLabel service once it's done.", textAlign: TextAlign.center, style: const TextStyle(fontSize: 12.5, color: AppColors.inkSoft, height: 1.6)),
            const SizedBox(height: 22),
            ElevatedButton(onPressed: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const BookingsScreen()), (r) => r.isFirst), child: const Text('View my bookings')),
          ]),
        ),
      ),
    );
  }
}
