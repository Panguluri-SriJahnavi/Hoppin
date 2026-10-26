import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state/app_state.dart';
import 'theme/app_theme.dart';
import 'screens/onboarding_screen.dart';

void main() {
  runApp(const HoppinApp());
}

class HoppinApp extends StatelessWidget {
  const HoppinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hoppin',
        theme: AppTheme.light(),
        builder: (context, child) {
          final largerText = context.select<AppState, bool>((s) => s.userProfile.largerText);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(largerText ? 1.15 : 1.0)),
            child: child!,
          );
        },
        home: const OnboardingScreen(),
      ),
    );
  }
}
