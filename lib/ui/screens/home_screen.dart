import 'package:flutter/material.dart';
import '../../core/theme/achaemenid_theme.dart';
import '../widgets/game_card.dart';
import '../widgets/connection_tutorial.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Show first-time tutorial after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ConnectionTutorial.show(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RoadTrip Games'),
        actions: [
          // Help / Tutorial button – always accessible
          IconButton(
            icon: const Icon(Icons.help_outline),
            tooltip: 'راهنمای اتصال',
            onPressed: () => ConnectionTutorial.show(context, force: true),
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              // TODO: language, about
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
                'آفلاین • هات‌اسپات + QR • بدون تبلیغات',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.9,
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
                      title: 'هفت خبیث',
                      subtitle: 'Haft Khabis',
                      icon: Icons.filter_7_outlined,
                      gameId: 'haft_khabis',
                    ),
                    GameCard(
                      title: 'اونو',
                      subtitle: 'Uno',
                      icon: Icons.filter_4_outlined,
                      gameId: 'uno',
                    ),
                    GameCard(
                      title: 'شطرنج',
                      subtitle: 'Chess',
                      icon: Icons.grid_on_outlined,
                      gameId: 'chess',
                    ),
                    GameCard(
                      title: 'مین‌روب',
                      subtitle: 'Minesweeper',
                      icon: Icons.dangerous_outlined,
                      gameId: 'minesweeper',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
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
