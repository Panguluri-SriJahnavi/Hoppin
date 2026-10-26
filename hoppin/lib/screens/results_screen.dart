import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/app_state.dart';
import '../models/vendor.dart';
import '../data/mock_data.dart';
import '../widgets/vendor_card.dart';
import 'vendor_profile_screen.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final list = state.filteredVendors;

    String title = 'All workers';
    if (state.filterCategoryId != null) {
      title = categoryById(state.filterCategoryId!).label;
    } else if (state.searchQuery != null && state.searchQuery!.isNotEmpty) {
      title = 'Results for "${state.searchQuery}"';
    }

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: [
          SizedBox(height: 40, child: ListView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 18), children: [
            _sortChip(context, 'Top rated', SortOption.rating),
            _sortChip(context, 'Nearest', SortOption.distance),
            _sortChip(context, 'Lowest price', SortOption.price),
          ])),
          const SizedBox(height: 6),
          SizedBox(height: 40, child: ListView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 18), children: [
            FilterChip(label: const Text('✅ Verified only', style: TextStyle(fontSize: 11.5)), selected: state.verifiedOnly, onSelected: (_) => context.read<AppState>().toggleVerifiedOnly()),
            const SizedBox(width: 8),
            FilterChip(label: const Text('Available now', style: TextStyle(fontSize: 11.5)), selected: state.availableNowOnly, onSelected: (_) => context.read<AppState>().toggleAvailableNow()),
            const SizedBox(width: 8),
            FilterChip(label: const Text('Under ₹300', style: TextStyle(fontSize: 11.5)), selected: state.priceBand == PriceBand.under300, onSelected: (_) => context.read<AppState>().setPriceBand(PriceBand.under300)),
            const SizedBox(width: 8),
            FilterChip(label: const Text('₹300–600', style: TextStyle(fontSize: 11.5)), selected: state.priceBand == PriceBand.mid, onSelected: (_) => context.read<AppState>().setPriceBand(PriceBand.mid)),
            const SizedBox(width: 8),
            FilterChip(label: const Text('₹600+', style: TextStyle(fontSize: 11.5)), selected: state.priceBand == PriceBand.over600, onSelected: (_) => context.read<AppState>().setPriceBand(PriceBand.over600)),
          ])),
          const SizedBox(height: 6),
          SizedBox(height: 40, child: ListView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 18), children: [
            ChoiceChip(label: const Text('Any worker', style: TextStyle(fontSize: 11.5)), selected: state.genderPref == null, onSelected: (_) => context.read<AppState>().setGenderPref(null)),
            const SizedBox(width: 8),
            ChoiceChip(label: const Text('Female preferred', style: TextStyle(fontSize: 11.5)), selected: state.genderPref == Gender.female, onSelected: (_) => context.read<AppState>().setGenderPref(Gender.female)),
            const SizedBox(width: 8),
            ChoiceChip(label: const Text('Male preferred', style: TextStyle(fontSize: 11.5)), selected: state.genderPref == Gender.male, onSelected: (_) => context.read<AppState>().setGenderPref(Gender.male)),
          ])),
          const SizedBox(height: 10),
          Expanded(
            child: list.isEmpty
                ? const Center(child: Padding(padding: EdgeInsets.all(24), child: Text('No workers found. Try a different search or filter.', textAlign: TextAlign.center)))
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                    itemCount: list.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (ctx, i) {
                      final v = list[i];
                      return VendorCard(vendor: v, onTap: () {
                        context.read<AppState>().selectVendor(v);
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const VendorProfileScreen()));
                      });
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _sortChip(BuildContext context, String label, SortOption option) {
    final state = context.watch<AppState>();
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(label: Text(label, style: const TextStyle(fontSize: 11.5)), selected: state.sort == option, onSelected: (_) => context.read<AppState>().setSort(option)),
    );
  }
}
