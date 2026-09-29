# RoadTrip Offline Games 🎲

**Offline Bluetooth multiplayer board & card games for road trips**  
Low storage • No ads • Cross-platform (iOS ↔ Android) • Local hotspot support  
Targeted for the Iranian market (Café Bazaar + Instagram + Telegram)

---

## Vision

An offline-first multiplayer game app designed for road trips, long car rides, and offline hangouts.  
Play classic games with 2+ players over **real Bluetooth** or **local Wi-Fi hotspot** — no internet required.

### Core Principles
- **Ultra-low storage** (< 30–40 MB)
- **Beautiful but lightweight graphics**
- **Extremely simple & fast UI** (optimized for car use / one-handed)
- **Zero annoying ads** in the offline version
- **True cross-platform** (iPhone ↔ Android)
- **Rock-solid Bluetooth + local hotspot** multiplayer

---

## MVP Games (Focus First)

We start **extremely focused**. Only these three games must be excellent:

1. **تخته‌نرد (Backgammon)**  
   - 2 players via Bluetooth  
   - 2 players on the same phone (pass-and-play)

2. **پاسور چهاربرگ (Pasur / 4-leaf card game)**  
   - 2 and 4 players  
   - Strong multiplayer support (especially 4 players)

3. **شطرنج ساده و تمیز (Clean & Simple Chess)**  
   - Classic rules  
   - Clean modern board design

> Casino games (Blackjack etc.) and full Uno will come later.  
> Focus = quality over quantity.

Later expansion ideas:
- Uno
- More Iranian traditional card games
- Online mode with optional ads / skins / donations

---

## Key Differentiators

| Feature                    | Priority | Notes |
|---------------------------|----------|-------|
| Real Bluetooth multiplayer | Critical | iOS ↔ Android |
| Local Wi-Fi Hotspot        | Critical | Fallback when Bluetooth is unstable |
| Cross-platform             | Critical | Flutter recommended |
| Same-device pass-and-play  | High     | Especially for Backgammon |
| 4-player support           | High     | Especially Pasur |
| Low storage & no ads       | Critical | Offline version completely free |
| Car-friendly UI            | High     | Large buttons, high contrast, minimal text |

---

## Tech Stack Recommendation

**Primary choice: Flutter**

Reasons:
- Excellent cross-platform (iOS + Android from one codebase)
- Good Bluetooth packages (`flutter_blue_plus`, `nearby_connections`, etc.)
- Can keep app size very small with careful asset management
- Fast development for polished UI
- Strong community for multiplayer / local networking

Alternative: React Native + Expo (but Bluetooth + size control is harder)

### Multiplayer Architecture
1. **Primary**: Bluetooth Low Energy (BLE) or classic Bluetooth  
2. **Fallback**: Local Wi-Fi hotspot + WebSocket / TCP  
3. Host creates room → Guests join by scanning or QR / short code

### Graphics Strategy
- Vector-based or highly optimized PNG/WebP assets
- Minimal animations
- Theme system (later monetization via skins)

---

## Monetization Plan

- **Offline version**: Completely free + zero ads  
  → Maximum user acquisition & trust

- **Future Online mode**:
  - Free account
  - Optional ads
  - Donations
  - Paid skins / themes / board designs

---

## Iranian Market Notes

- Users hate heavy apps, too many ads, and bugs
- Traditional games (تخته‌نرد, پاسور, شطرنج) still have strong demand
- Distribution: **Café Bazaar** is essential + Instagram + Telegram channels
- Support for Persian language from day one

**Main risks**:
1. Stable Bluetooth between iOS and Android is technically hard
2. Low quality → users return to existing apps quickly
3. Marketing in Iran is critical

---

## Project Structure (Planned)

```
roadtrip-offline-games/
├── README.md
├── docs/
│   ├── mvp-scope.md
│   ├── multiplayer-architecture.md
│   └── design-system.md
├── assets/
│   ├── boards/
│   ├── cards/
│   └── icons/
├── lib/                    # Flutter source
│   ├── main.dart
│   ├── games/
│   │   ├── backgammon/
│   │   ├── pasur/
│   │   └── chess/
│   ├── multiplayer/
│   ├── ui/
│   └── core/
├── pubspec.yaml
└── ...
```

---

## Next Steps

1. Finalize tech stack & create Flutter project skeleton
2. Design simple high-contrast UI (car-friendly)
3. Implement local multiplayer foundation (Bluetooth + Hotspot)
4. Build Backgammon first (most popular for road trips)
5. Then Pasur (4-player challenge)
6. Then Chess

---

## Contributing

This is currently a private/personal project under active planning.  
Feel free to open issues with ideas or feedback.

---

**Made for long Iranian road trips** 🇮🇷  
No internet. Just friends, cards, and dice.
