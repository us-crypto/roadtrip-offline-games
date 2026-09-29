import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/achaemenid_theme.dart';
import 'ui/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const ProviderScope(child: RoadTripApp()));
}

class RoadTripApp extends StatelessWidget {
  const RoadTripApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RoadTrip Offline Games',
      debugShowCheckedModeBanner: false,
      theme: AchaemenidTheme.dark,
      // TODO: add localization delegates for Persian
      home: const HomeScreen(),
    );
  }
}
