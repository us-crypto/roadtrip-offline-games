# RoadTrip Offline Games 🎲

**Offline Bluetooth multiplayer board & card games for road trips**  
Low storage • No ads • Cross-platform (iOS ↔ Android) • Local hotspot support  
**Achaemenid Empire (pre-Islamic Persia) visual theme**  
Targeted for the Iranian market (Café Bazaar + Instagram + Telegram)

---

## Vision

An offline-first multiplayer game app designed for road trips, long car rides, and offline hangouts.  
Play classic games with 2+ players over **real Bluetooth** or **local Wi-Fi hotspot** — no internet required.

Inspired by the grandeur of the **Achaemenid Empire** (Persepolis, Susa): deep blues, gold, turquoise, high-contrast relief-style UI that remains readable in a moving car.

### Core Principles
- **Ultra-low storage** (< 30–40 MB)
- **Beautiful but lightweight graphics** (Achaemenid-inspired)
- **Extremely simple & fast UI** (optimized for car use / one-handed)
- **Zero annoying ads** in the offline version
- **True cross-platform** (iPhone ↔ Android)
- **Rock-solid Bluetooth + local hotspot** multiplayer

---

## MVP Games

1. **تخته‌نرد (Backgammon)**  
   - 2 players via Bluetooth / Hotspot  
   - 2 players on the same phone (pass-and-play)

2. **پاسور چهاربرگ (Pasur)**  
   - 2 and 4 players  
   - Strong multiplayer support

3. **شطرنج ساده و تمیز (Clean Chess)**  
   - Classic rules  
   - Clean modern board with Achaemenid styling

4. **Uno**  
   - 2–4 players  
   - Classic rules + simple house rules

> Focus remains quality over quantity. Casino games later.

---

## Key Differentiators

| Feature                    | Priority | Notes |
|---------------------------|----------|-------|
| Real Bluetooth multiplayer | Critical | Hybrid approach (see docs) |
| Local Wi-Fi Hotspot        | Critical | Most reliable fallback |
| Cross-platform             | Critical | Flutter |
| Same-device pass-and-play  | High     | Especially Backgammon |
| 4-player support           | High     | Pasur & Uno |
| Low storage & no ads       | Critical | Offline completely free |
| Car-friendly UI            | High     | Large buttons, high contrast |
| Achaemenid visual identity | High     | Gold + turquoise on dark stone |

---

## Tech Stack

**Flutter** (recommended & used)

### Multiplayer Strategy (2026 research)
- **Primary reliable path**: Local Wi-Fi Hotspot + WebSocket / TCP (most stable for 2–4 players across iOS/Android)
- **Bluetooth discovery + connection**: `flutter_blue_plus` (best maintained BLE package) + custom GATT or hybrid
- **P2P helpers**: `flutter_nearby_connections` / forks (Android Nearby Connections + iOS MultipeerConnectivity)
- Pure phone-to-phone BLE is still technically hard for multi-device; hybrid is the practical choice for reliability.

See `docs/multiplayer-architecture.md` for details.

### Other packages
- State: Riverpod or Bloc
- UI: Material 3 + custom Achaemenid theme
- Localization: `flutter_localizations` + Persian (fa)
- Assets: optimized WebP / SVG where possible

---

## Design Theme – Achaemenid Empire

- **Primary palette**: Deep lapis/Egyptian blue, gold, turquoise/malachite green, cinnabar red accents, dark stone gray/black backgrounds
- **Motifs**: Rosettes, geometric borders, simplified Persepolis reliefs, winged elements (subtle)
- **Typography**: High-contrast, large sizes for car readability
- **Buttons**: Large touch targets, gold borders on dark panels

Full details in `docs/design-system.md`.

---

## Project Status

- [x] Repository + vision README
- [x] Detailed docs (MVP scope, multiplayer architecture, design system)
- [x] Flutter project skeleton (`pubspec.yaml`, `lib/` structure, theme, basic screens)
- [ ] Core multiplayer layer
- [ ] Backgammon implementation
- [ ] Pasur implementation
- [ ] Chess implementation
- [ ] Uno implementation
- [ ] Testing on real devices (iOS + Android)
- [ ] Café Bazaar preparation

---

## Monetization

- Offline version: completely free, zero ads
- Future online: optional ads / donations / paid Achaemenid skins & boards

---

## Iranian Market Notes

Users are sensitive to heavy size, aggressive ads, and bugs. Traditional games still have strong demand. Persian language from day one. Marketing via Café Bazaar + Instagram + Telegram is essential.

---

**Made for long Iranian road trips** 🇮🇷  
No internet. Just friends, cards, dice, and the spirit of Persepolis.
