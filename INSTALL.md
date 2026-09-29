# How to Install & Test on Android (Step-by-Step)

These instructions are for you and your helper in Iran. The app is still in early development (skeleton + multiplayer foundation + Backgammon start). Full playable games will come next.

## Option A – Best for testing (Flutter developer mode)

### Requirements on the test phone
- Android 8.0+ (recommended Android 10+)
- Developer Options enabled
- USB Debugging enabled

### Steps for the developer (you)

1. Install Flutter SDK on your computer: https://docs.flutter.dev/get-started/install
2. Clone the private repo (after you make it private and add collaborator if needed):
   ```bash
   git clone https://github.com/us-crypto/roadtrip-offline-games.git
   cd roadtrip-offline-games
   ```
3. Get dependencies:
   ```bash
   flutter pub get
   ```
4. Connect the Android phone via USB (or use wireless debugging).
5. Accept the USB debugging prompt on the phone.
6. Run:
   ```bash
   flutter devices          # confirm the phone is seen
   flutter run --release    # or just flutter run for debug
   ```

The app will install and open automatically.

### First-time multiplayer tutorial
On first launch a tutorial popup will appear explaining how to connect via Hotspot + QR code. Later you can open it again from the help icon on the home screen.

## Option B – Share an APK (easier for helper in Iran)

1. On your computer, after `flutter pub get`:
   ```bash
   flutter build apk --release
   ```
2. The file will be at:
   `build/app/outputs/flutter-apk/app-release.apk`
3. Send this APK to your helper (Telegram, email, Google Drive, etc.).
4. On the Android phone:
   - Open the APK file
   - Allow “Install from unknown sources” if asked
   - Install and open the app

**Note**: Because the app uses local network / Hotspot, both phones must be able to create or join a personal hotspot. No internet is required after installation.

## Testing Multiplayer (Hotspot + QR)

1. Phone A (Host):
   - Open the app → choose a game → “Create Room”
   - Turn on Personal Hotspot (or the app will guide)
   - A QR code + short room code will appear

2. Phone B (Guest):
   - Connect to Phone A’s Hotspot (Wi-Fi)
   - Open the app → “Join Room”
   - Scan the QR code **or** type the short code

3. Both players should see each other and be able to start the game.

## Current Games Status (as of this commit)
- Home screen + Achaemenid theme: working
- First-time connection tutorial: implemented
- Multiplayer host/guest + WebSocket skeleton: ready
- QR code support: added
- Backgammon: board + basic rules started
- Pasur, Uno, Chess, هفت خبیث (Haft Khabis), Minesweeper: placeholders / coming next

## Making the repository private

1. Go to https://github.com/us-crypto/roadtrip-offline-games
2. Click **Settings**
3. Scroll to **Danger Zone**
4. Click **Change visibility** → **Make private**
5. Confirm

After it is private, you can invite your helper as a collaborator if she needs to pull the code herself.

## Need help?
Open an issue in the repo or reply here with screenshots / error messages.
