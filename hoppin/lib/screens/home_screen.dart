import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/app_state.dart';
import '../theme/app_theme.dart';
import '../data/mock_data.dart';
import '../widgets/vendor_card.dart';
import '../widgets/app_drawer.dart';
import 'results_screen.dart';
import 'map_screen.dart';
import 'vendor_profile_screen.dart';
import 'bookings_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int navIndex = 0;
  final searchCtrl = TextEditingController();

  void _runSearch() {
    final q = searchCtrl.text.trim();
    if (q.isEmpty) return;
    context.read<AppState>().setFilter(categoryId: null, query: q);
    Navigator.push(context, MaterialPageRoute(builder: (_) => const ResultsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final topVendors = [...vendors]..sort((a, b) => b.rating.compareTo(a.rating));

    return Scaffold(
      drawer: const AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 6, 18, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Builder(builder: (ctx) => IconButton(onPressed: () => Scaffold.of(ctx).openDrawer(), icon: const Icon(Icons.menu))),
                  const Spacer(),
                  const CircleAvatar(radius: 18, backgroundColor: AppColors.accent, child: Icon(Icons.person, size: 18, color: Colors.white)),
                ]),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(color: const Color(0xFFE7EFE6), borderRadius: BorderRadius.circular(100)),
                  child: const Text('📍 Mangalagiri, Andhra Pradesh  ▾', style: TextStyle(color: AppColors.primaryDark, fontWeight: FontWeight.w700, fontSize: 11.5)),
                ),
                const SizedBox(height: 12),
                const Text('Good afternoon', style: TextStyle(color: AppColors.inkSoft, fontWeight: FontWeight.w600, fontSize: 11.5)),
                Text(state.userProfile.name.isNotEmpty ? 'Hi, ${state.userProfile.name.split(" ").first}' : 'Hi there', style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 14),
                Row(children: [
                  Expanded(child: TextField(controller: searchCtrl, onSubmitted: (_) => _runSearch(), decoration: const InputDecoration(prefixIcon: Icon(Icons.search, size: 20), hintText: 'Search "electrician", "cook"...'))),
                  const SizedBox(width: 8),
                  ElevatedButton(onPressed: _runSearch, child: const Text('Search')),
                ]),
                const SizedBox(height: 10),
                Row(children: [
                  Expanded(child: OutlinedButton(onPressed: () { final p = state.userProfile; p.largerText = !p.largerText; setState(() {}); }, child: const Text('Aa Larger text', style: TextStyle(fontSize: 11)))),
                  const SizedBox(width: 8),
                  Expanded(child: OutlinedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MapScreen())), child: const Text('📍 View on map', style: TextStyle(fontSize: 11)))),
                ]),
                const SizedBox(height: 18),
                const Text('CATEGORIES', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.inkSoft, letterSpacing: 0.5)),
                const SizedBox(height: 10),
                SizedBox(
                  height: 92,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                    itemBuilder: (ctx, i) {
                      final c = categories[i];
                      return InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {
                          context.read<AppState>().setFilter(categoryId: c.id, query: null);
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const ResultsScreen()));
                        },
                        child: Container(
                          width: 84, padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(color: AppColors.surface, border: Border.all(color: AppColors.border), borderRadius: BorderRadius.circular(16)),
                          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                            Icon(c.icon, size: 22, color: AppColors.primary),
                            const SizedBox(height: 6),
                            Text(c.label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
                          ]),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 18),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  const Text('TOP RATED NEAR YOU', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.inkSoft)),
                  TextButton(onPressed: () {
                    context.read<AppState>().setFilter(categoryId: null, query: null);
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const ResultsScreen()));
                  }, child: const Text('See all ›')),
                ]),
                ...topVendors.take(3).map((v) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: VendorCard(vendor: v, onTap: () {
                        context.read<AppState>().selectVendor(v);
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const VendorProfileScreen()));
                      }),
                    )),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: navIndex,
        onDestinationSelected: (i) {
          setState(() => navIndex = i);
          if (i == 1) Navigator.push(context, MaterialPageRoute(builder: (_) => const MapScreen()));
          if (i == 2) Navigator.push(context, MaterialPageRoute(builder: (_) => const BookingsScreen()));
          if (i == 3) Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen()));
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.map), label: 'Map'),
          NavigationDestination(icon: Icon(Icons.list_alt), label: 'Bookings'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
