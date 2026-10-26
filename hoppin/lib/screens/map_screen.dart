import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/app_state.dart';
import '../data/mock_data.dart';
import '../theme/app_theme.dart';
import 'vendor_profile_screen.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nearest = [...vendors]..sort((a, b) => a.distanceKm.compareTo(b.distanceKm));
    final top = nearest.first;

    return Scaffold(
      appBar: AppBar(title: const Text('Nearby vendors')),
      body: Column(children: [
        Expanded(
          child: Container(
            color: const Color(0xFFE7EEE1),
            child: Stack(children: [
              const Center(child: Icon(Icons.circle, color: AppColors.accent, size: 16)),
              Positioned(top: 60, left: 50, child: Icon(top.icon, color: AppColors.primary, size: 28)),
              const Positioned(top: 120, right: 60, child: Icon(Icons.cleaning_services, color: AppColors.primary, size: 28)),
              const Positioned(bottom: 100, left: 80, child: Icon(Icons.menu_book, color: AppColors.primary, size: 28)),
            ]),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.vertical(top: Radius.circular(22))),
          child: InkWell(
            onTap: () {
              context.read<AppState>().selectVendor(top);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const VendorProfileScreen()));
            },
            child: Row(children: [
              Container(width: 50, height: 50, decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(12)), child: Icon(top.icon, color: Colors.white)),
              const SizedBox(width: 12),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(top.name, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13.5)),
                Text('★ ${top.rating} · ${top.distanceKm} km · ${top.availability}', style: const TextStyle(fontSize: 11.5, color: AppColors.inkSoft)),
              ])),
            ]),
          ),
        ),
      ]),
    );
  }
}
