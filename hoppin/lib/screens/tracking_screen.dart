import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/app_state.dart';
import '../theme/app_theme.dart';
import 'checkout_screen.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vendor = context.watch<AppState>().currentVendor!;
    return Scaffold(
      appBar: AppBar(title: const Text('Booking status'), automaticallyImplyLeading: false),
      body: Column(children: [
        Container(
          height: 190, color: const Color(0xFFE7EEE1),
          child: Stack(children: [
            Positioned(top: 40, left: 40, child: Icon(vendor.icon, color: AppColors.accent, size: 30)),
            const Positioned(bottom: 40, right: 60, child: Icon(Icons.circle, color: AppColors.accent, size: 16)),
          ]),
        ),
        Container(
          margin: const EdgeInsets.all(18), padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: AppColors.surface, border: Border.all(color: AppColors.border), borderRadius: BorderRadius.circular(16)),
          child: Row(children: [
            Icon(vendor.icon, color: AppColors.primary),
            const SizedBox(width: 12),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('${vendor.name} is on the way', style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13.5)),
              Text('Estimated arrival: ${vendor.arrival}', style: const TextStyle(fontSize: 11.5, color: AppColors.inkSoft)),
            ]),
          ]),
        ),
        Expanded(
          child: ListView(padding: const EdgeInsets.symmetric(horizontal: 18), children: [
            _step('Booking requested', done: true),
            _step('Vendor accepted', done: true),
            _step('On the way — live tracking', current: true),
            _step('Job in progress'),
            _step('Completed & rated'),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(18),
          child: SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CheckoutScreen())), child: const Text('Continue to payment'))),
        ),
      ]),
    );
  }

  Widget _step(String title, {bool done = false, bool current = false}) {
    final color = done ? AppColors.success : (current ? AppColors.accent : AppColors.border);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(width: 22, height: 22, decoration: BoxDecoration(color: color, shape: BoxShape.circle), child: done ? const Icon(Icons.check, size: 13, color: Colors.white) : null),
        const SizedBox(width: 12),
        Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13.5)),
      ]),
    );
  }
}
