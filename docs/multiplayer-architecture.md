# Multiplayer Architecture

## Reality Check (2026)

True reliable **phone-to-phone multiplayer** that works seamlessly between iOS and Android over pure Bluetooth is still difficult because:

- iOS uses Multipeer Connectivity / Core Bluetooth with strict background and advertising limits.
- Android uses Nearby Connections / BLE / Wi-Fi Direct with different permission and power models.
- Many “Bluetooth multiplayer” packages only work well same-OS or require one device to act as a peripheral.

Therefore we use a **hybrid approach** optimized for reliability and low friction.

## Recommended Stack

### 1. Discovery Layer
- `flutter_blue_plus` (best maintained BLE package in 2026) for nearby device scanning / advertising where useful.
- Optional: `flutter_nearby_connections` (or maintained forks such as `flutter_nearby_connections_plus`) for higher-level P2P discovery on supported platforms.

### 2. Primary Data Transport (Most Reliable)
**Local Wi-Fi Hotspot + WebSocket / TCP sockets**

Flow:
1. Host creates a personal hotspot (or joins an existing local network).
2. Host starts a lightweight WebSocket / TCP server inside the app.
3. Guests connect using the host’s local IP (shown as a short code or QR) or automatic discovery when on the same network.
4. All game state is synchronized over the socket with a simple JSON protocol.

Why this is preferred:
- Works reliably across iOS ↔ Android.
- Supports 2–4 players easily.
- Higher bandwidth and lower latency than pure BLE for card/board game moves.
- Easy to debug.

### 3. Bluetooth as Fallback / Companion
- Use BLE mainly for “I’m nearby – join me” discovery and short room codes.
- For pure 1:1 BLE sessions (especially Android-heavy), packages like `ble_peer_session` can be evaluated later.
- Keep BLE data path as optional secondary transport for very simple 2-player cases.

## High-Level Protocol

```
Host                  Guests
  |                     |
  |-- create room ----->|
  |   (room code / IP)  |
  |<-- join request ----|
  |-- accept + sync ----|
  |                     |
  |<-- game actions ----|
  |-- state updates ----|
```

Message types (JSON):
- `room_info`, `join`, `leave`, `player_ready`
- `game_start`, `game_state`, `move`, `chat` (optional)
- `heartbeat`, `disconnect`

## Host / Guest Model
- One device is always the authoritative host (simplifies conflict resolution).
- Host runs the game logic and broadcasts state.
- Guests send intent (moves) and receive authoritative state.

## Same-Device Mode
Pass-and-play is implemented purely locally (no network). Useful for Backgammon and Chess when only one phone is available.

## Permissions & UX
- Request Bluetooth + Location (Android Nearby) + Local Network (iOS) only when user starts multiplayer.
- Clear Persian + English explanations why each permission is needed.
- Graceful degradation: if Bluetooth fails, offer “Create Hotspot / Enter Code” flow.

## Package Candidates (2026)

| Package                    | Role                          | Notes |
|---------------------------|-------------------------------|-------|
| flutter_blue_plus         | BLE scan / connect / GATT     | Most actively maintained |
| flutter_nearby_connections| Higher-level P2P              | Android Nearby + iOS Multipeer; cross-OS can be limited |
| shelf / web_socket_channel| Local server + client         | For Hotspot transport |
| connectivity_plus         | Network state                 | Detect hotspot / Wi-Fi |
| qr_flutter + mobile_scanner | Optional QR join            | Nice UX |

## Implementation Order
1. Same-device pass-and-play (no network).
2. Local Hotspot + WebSocket host/guest for 2 players.
3. Extend to 4 players.
4. Add BLE discovery layer on top.
5. Polish reconnection & host migration later if needed.

This hybrid strategy maximizes the chance that two real phones (iPhone + Android) can actually play together on a road trip without frustration.
