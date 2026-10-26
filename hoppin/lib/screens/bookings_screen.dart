import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/app_state.dart';
import '../models/booking.dart';
import '../data/mock_data.dart';
import '../theme/app_theme.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final active = state.currentBooking;
    final history = state.bookingHistory;

    return Scaffold(
      appBar: AppBar(title: const Text('My bookings')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 12, 18, 18),
        children: [
          if (active != null && active.status != BookingStatus.completed)
            _bookingRow(active.vendor.name, active.vendor.icon, categoryById(active.vendor.categoryId).label, 'Live', AppColors.accentDark),
          ...history.map((b) => _bookingRow(b.vendor.name, b.vendor.icon, categoryById(b.vendor.categoryId).label, 'Completed', AppColors.inkSoft)),
          if (active == null && history.isEmpty)
            const Padding(padding: EdgeInsets.only(top: 60), child: Center(child: Text('No bookings yet — book a worker from Home to see it here.', style: TextStyle(color: AppColors.inkSoft)))),
        ],
      ),
    );
  }

  Widget _bookingRow(String name, IconData icon, String category, String status, Color statusColor) => Container(
        margin: const EdgeInsets.only(bottom: 12), padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: AppColors.surface, border: Border.all(color: AppColors.border), borderRadius: BorderRadius.circular(16)),
        child: Row(children: [
          Container(width: 48, height: 48, decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(12)), child: Icon(icon, color: Colors.white)),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('$name — $category', style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13))])),
          Text(status, style: TextStyle(color: statusColor, fontWeight: FontWeight.w700, fontSize: 12)),
        ]),
      );
}
