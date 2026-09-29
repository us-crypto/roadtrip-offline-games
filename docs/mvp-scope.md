# MVP Scope – RoadTrip Offline Games

## Goal
Ship a polished, offline-first, low-storage multiplayer app with four excellent games, Achaemenid visual identity, and reliable local multiplayer (Bluetooth discovery + Wi-Fi Hotspot fallback).

Target size: **under 40 MB** installed.

## Included Games

### 1. تخته‌نرد (Backgammon)
- 2 players
- Modes: Bluetooth / Hotspot multiplayer + same-device pass-and-play
- Full rules (including doubles, bearing off)
- Simple AI optional (post-MVP)
- High-contrast board with Achaemenid styling (dark wood/stone + gold points)

### 2. پاسور چهاربرگ (Pasur)
- 2 players and 4 players
- Classic Iranian rules
- Strong focus on 4-player table experience
- Clear turn indicators and large card faces

### 3. شطرنج (Chess)
- Classic FIDE rules
- Clean board + pieces with Achaemenid aesthetic (optional piece skins later)
- 2 players (local or multiplayer)
- Move history / undo for casual play

### 4. Uno
- 2–4 players
- Classic rules + optional house rules (stacking, etc.)
- Large, readable cards
- Smooth multiplayer turn flow

## Explicitly Out of Scope for MVP
- Online accounts / leaderboards
- Casino games (Blackjack, Poker, etc.)
- Complex animations or 3D
- In-app purchases in offline mode
- Heavy sound packs
- Advanced AI opponents (simple random or basic heuristic only if time allows)

## Platforms
- Android (primary for Iranian market – Café Bazaar)
- iOS (true cross-play with Android is a hard requirement)

## Languages
- Persian (fa) – primary
- English – secondary

## Success Criteria for MVP
1. Two real devices (one iOS, one Android) can play any of the four games without internet.
2. App size stays low.
3. UI remains usable while the phone is held in a car (large targets, high contrast).
4. No crashes during normal 30–60 min sessions.
5. Clear host/join flow with short room codes or nearby discovery.

## Priority Order of Implementation
1. Core multiplayer foundation (Hotspot + discovery)
2. Shared UI kit + Achaemenid theme
3. Backgammon (most requested for road trips)
4. Uno (fast to implement once multiplayer exists)
5. Pasur (4-player complexity)
6. Chess

## Non-Functional Requirements
- Offline 100%
- No forced internet permission for core play
- Graceful handling of Bluetooth/Wi-Fi permission denials
- Battery-conscious (no aggressive scanning loops)
