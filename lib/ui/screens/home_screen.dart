import 'package:flutter/material.dart';
import '../../core/theme/achaemenid_theme.dart';
import '../widgets/game_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RoadTrip Games'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              // TODO: settings / language / about
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'بازی‌های جاده‌ای',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'آفلاین • بلوتوث • بدون تبلیغات',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.85,
                  children: const [
                    GameCard(
                      title: 'تخته‌نرد',
                      subtitle: 'Backgammon',
                      icon: Icons.casino_outlined,
                      gameId: 'backgammon',
                    ),
                    GameCard(
                      title: 'پاسور',
                      subtitle: 'Pasur',
                      icon: Icons.style_outlined,
                      gameId: 'pasur',
                    ),
                    GameCard(
                      title: 'شطرنج',
                      subtitle: 'Chess',
                      icon: Icons.grid_on_outlined,
                      gameId: 'chess',
                    ),
                    GameCard(
                      title: 'اونو',
                      subtitle: 'Uno',
                      icon: Icons.filter_4_outlined,
                      gameId: 'uno',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'طراحی الهام‌گرفته از امپراتوری هخامنشی',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AchaemenidTheme.turquoise,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
