import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/app_state.dart';
import '../theme/app_theme.dart';
import 'signup_screen.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String selectedLang = 'en';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFF14646A), AppColors.primary, AppColors.primaryDark])),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 64, height: 64, decoration: BoxDecoration(color: AppColors.accent, borderRadius: BorderRadius.circular(20)), child: const Center(child: Text('🐇', style: TextStyle(fontSize: 30)))),
                const SizedBox(height: 22),
                Text('Hoppin', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white, fontSize: 34)),
                const SizedBox(height: 8),
                const Text('Trusted local help, tracked live and paid for safely — in your language.', textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.5)),
                const SizedBox(height: 26),
                Wrap(spacing: 8, alignment: WrapAlignment.center, children: [_langChip('en', 'English'), _langChip('te', 'తెలుగు'), _langChip('hi', 'हिंदी')]),
                const SizedBox(height: 26),
                SizedBox(width: double.infinity, child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.accent, foregroundColor: const Color(0xFF241503)),
                  onPressed: () {
                    context.read<AppState>().userProfile.language = selectedLang;
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const SignupScreen()));
                  },
                  child: const Text('Get started'),
                )),
                const SizedBox(height: 10),
                SizedBox(width: double.infinity, child: OutlinedButton(
                  style: OutlinedButton.styleFrom(foregroundColor: Colors.white, side: const BorderSide(color: Colors.white54)),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HomeScreen())),
                  child: const Text('I already have an account'),
                )),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _langChip(String code, String label) {
    final active = selectedLang == code;
    return ChoiceChip(
      label: Text(label),
      selected: active,
      onSelected: (_) => setState(() => selectedLang = code),
      selectedColor: AppColors.accent,
      backgroundColor: Colors.white.withOpacity(0.08),
      labelStyle: TextStyle(color: active ? const Color(0xFF241503) : Colors.white, fontWeight: FontWeight.w600, fontSize: 12.5),
      shape: StadiumBorder(side: BorderSide(color: Colors.white.withOpacity(0.35))),
    );
  }
}
