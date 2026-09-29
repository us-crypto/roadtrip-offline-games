# Design System – Achaemenid Empire Theme

## Inspiration
Visual language drawn from the Achaemenid Empire (c. 550–330 BCE):
- Persepolis & Susa reliefs and glazed bricks
- Colors reconstructed from archaeological evidence: Egyptian blue / lapis, gold, malachite green, cinnabar red, black, white
- Motifs: rosettes, geometric borders, palm trees, bulls/lions (simplified), winged elements (subtle, not religious)

The goal is **grandeur + extreme readability** while the phone is used in a moving car.

## Color Palette

### Core
| Role              | Hex       | Name / Notes                  |
|-------------------|-----------|-------------------------------|
| Background        | `#1A1A1A` | Dark stone / night            |
| Surface           | `#2A2A2A` | Slightly lighter panel        |
| Primary (Gold)    | `#D4AF37` | Imperial gold                 |
| Secondary (Lapis) | `#1E3A5F` | Deep Achaemenid blue          |
| Accent (Turquoise)| `#2A9D8F` | Malachite / turquoise         |
| Danger / Highlight| `#C73E1D` | Cinnabar red                  |
| Text Primary      | `#F5F5F5` | High contrast white           |
| Text Secondary    | `#B0B0B0` | Muted                         |
| Success           | `#2A9D8F` | Same as accent                |

### Usage Rules
- Backgrounds stay dark for night-time / car use and battery.
- Gold is used for primary actions, borders, and important highlights.
- Large touch targets (≥ 48–56 dp) with generous padding.
- Never rely on color alone for game state (use icons + text).

## Typography
- Primary font: system / Inter or a clean Persian-supporting font (Vazirmatn recommended for fa).
- Minimum body size: 16–18 sp
- Button text: 18–20 sp, bold
- Titles: 24–28 sp
- High contrast only – no light gray on dark for critical info.

## Components

### Buttons
- Primary: Gold fill or gold border + dark fill, large radius or slight geometric cut.
- Secondary: Outlined in turquoise or gold.
- Minimum height: 56 dp.
- Clear pressed / disabled states.

### Cards & Boards
- Dark panels with thin gold or turquoise borders.
- Subtle rosette or geometric corner ornaments (vector, very light weight).
- Card faces: high contrast, large rank/suit, minimal decoration so they remain readable at a glance.

### Navigation
- Bottom navigation or simple grid of large game icons on home.
- Minimal chrome – maximize play area.

### Game-Specific Notes
- **Backgammon**: Dark board, gold points, clear checkers.
- **Pasur / Uno**: Extra-large cards, strong suit colors that still work on dark theme.
- **Chess**: Classic board with optional Achaemenid piece set (later).

## Accessibility & Car Use
- One-handed friendly where possible.
- Large hit areas.
- Avoid small icons without labels.
- Support system font scaling.
- Persian RTL layout fully supported.

## Asset Guidelines
- Prefer SVG or highly optimized WebP.
- No heavy image backgrounds.
- Total asset budget kept tight so the whole app stays under ~40 MB.

## Theme Implementation (Flutter)
Use a single `ThemeData` + custom `ColorScheme` and component themes.  
All screens should pull colors from the theme so future “royal skins” can be added easily for monetization.
