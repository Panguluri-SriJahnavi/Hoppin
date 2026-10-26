import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/app_state.dart';
import '../theme/app_theme.dart';
import 'tracking_screen.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final vendor = state.currentVendor!;
    final quote = state.currentBooking!.quote!;

    return Scaffold(
      appBar: AppBar(title: const Text('Vendor accepted ✓'), automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppColors.surface, border: Border.all(color: AppColors.accent, width: 1.5), borderRadius: BorderRadius.circular(16)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('${vendor.name} sent an estimate', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              _line('Inspection / visiting charge', quote.inspectionCharge),
              _line('Estimated parts & labour', quote.estimatedParts),
              const Divider(),
              _line('Estimated total', quote.total, bold: true),
              const SizedBox(height: 14),
              Row(children: [
                Expanded(child: OutlinedButton(onPressed: () => Navigator.of(context).popUntil((r) => r.isFirst), child: const Text('Decline'))),
                const SizedBox(width: 10),
                Expanded(child: ElevatedButton(onPressed: () {
                  context.read<AppState>().beginTracking();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const TrackingScreen()));
                }, child: const Text('Accept & continue'))),
              ]),
              const SizedBox(height: 10),
              Text("Final bill may vary slightly if more parts are needed once ${vendor.name.split(' ').first} inspects the issue.", style: const TextStyle(fontSize: 11, color: AppColors.inkSoft)),
            ]),
          ),
          const SizedBox(height: 14),
          const Text("Electricians, plumbers and similar repair jobs can't have a fixed price upfront — the vendor gives an estimate after seeing the issue, and the final bill may change slightly.", style: TextStyle(fontSize: 11.5, color: AppColors.inkSoft, height: 1.5)),
        ]),
      ),
    );
  }

  Widget _line(String label, double amount, {bool bold = false}) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(label, style: TextStyle(fontSize: bold ? 14 : 12.5, fontWeight: bold ? FontWeight.w800 : FontWeight.w400)),
          Text('₹${amount.toStringAsFixed(0)}', style: TextStyle(fontSize: bold ? 14 : 12.5, fontWeight: bold ? FontWeight.w800 : FontWeight.w400)),
        ]),
      );
}
