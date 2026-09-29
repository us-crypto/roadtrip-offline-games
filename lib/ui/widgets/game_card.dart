import 'package:flutter/material.dart';
import '../../core/theme/achaemenid_theme.dart';
import '../../games/backgammon/backgammon_screen.dart';
import '../../games/pasur/pasur_screen.dart';
import '../../games/chess/chess_screen.dart';
import '../../games/uno/uno_screen.dart';
import '../../games/haft_khabis/haft_khabis_screen.dart';
import '../../games/minesweeper/minesweeper_screen.dart';

class GameCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String gameId;

  const GameCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.gameId,
  });

  void _openGame(BuildContext context) {
    Widget screen;
    switch (gameId) {
      case 'backgammon':
        screen = const BackgammonScreen();
        break;
      case 'pasur':
        screen = const PasurScreen();
        break;
      case 'chess':
        screen = const ChessScreen();
        break;
      case 'uno':
        screen = const UnoScreen();
        break;
      case 'haft_khabis':
        screen = const HaftKhabisScreen();
        break;
      case 'minesweeper':
        screen = const MinesweeperScreen();
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$subtitle coming soon'), backgroundColor: AchaemenidTheme.lapis),
        );
        return;
    }
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _openGame(context),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: AchaemenidTheme.gold),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AchaemenidTheme.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 13, color: AchaemenidTheme.textSecondary),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
