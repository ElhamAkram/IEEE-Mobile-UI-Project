# IEEE-Mobile-UI-Project
# 🍽️ Recipe Explorer

A beautifully designed Flutter mobile app that helps users discover, explore, and cook delicious recipes.

---

## 📱 Screens

| Screen | File | Description |
|--------|------|-------------|
| Welcome | `welcome_screen.dart` | Splash / onboarding screen |
| Home | `home_screen.dart` | Browse categories & recommended recipes |
| Item Details | `itemsdetails.dart` | Full recipe info with ingredients & steps |
| Cooking | `CookingScreen.dart` | Choose your main ingredient before cooking |
| Favorites | `favorite.dart` | Saved favorite recipes |
| Profile | `profile.dart` | User profile screen |

---

## 🗂️ Project Structure

```
lib/
├── main.dart
└── screens/
    ├── welcome_screen.dart
    ├── home_screen.dart
    ├── itemsdetails.dart
    ├── CookingScreen.dart
    ├── favorite.dart
    └── profile.dart
```

---

## ✨ Features

- 🔍 Search recipes by name
- 🗂️ Browse by category (Breakfast, Lunch, Dinner)
- 📋 View full recipe details — ingredients & step-by-step instructions
- ❤️ Save your favorite recipes
- 🍳 Start cooking flow with ingredient selection (Meat / Tuna / Pasta)
- 🔁 Smooth screen transitions with slide animations

---

## 🎨 Design

| Property | Value |
|----------|-------|
| Primary Color | `#FF8C00` (Orange) |
| Background | `#FFF8F2` (Warm White) |
| Font Style | Bold headings, clean body text |
| Theme | Warm food-inspired palette |

---

## 🧭 Navigation Flow

```
WelcomeScreen
     ↓
HomeScreen
     ↓
ItemDetails  ──→  CookingScreen
     ↓
FavoriteScreen / ProfileScreen
```

---

## 👨‍💻 Built With

- [Flutter] — UI Framework
- [Dart] — Programming Language

---

## 📸 UI Highlights

- `SliverAppBar` with collapsible food image in Item Details
- `AnimatedContainer` for smooth tab switching
- `SlideTransition` between screens
- `GridView` for recipe cards on Home screen
- `BottomNavigationBar` for main navigation

---

## 🎬 Animation Research & Implementation

### Animations Researched

| Animation | Type | Description |
|-----------|------|-------------|
| `SlideTransition` | Explicit | Slides a screen in from a given direction |
| `FadeTransition` | Explicit | Fades a widget in or out smoothly |
| `ScaleTransition` | Explicit | Scales a widget up or down |
| `AnimatedContainer` | Implicit | Smoothly animates changes in a container's properties (color, size, border) |
| `AnimatedOpacity` | Implicit | Gradually changes a widget's opacity |
| `Hero` | Implicit | Flies a shared widget between two screens |
| `PageRouteBuilder` | Explicit | Custom transition when navigating between screens |

### Animations Chosen & Why

**1. `PageRouteBuilder` + `SlideTransition` — Screen Navigation**
> 🔴 Type: **Explicit Animation**

Used when navigating from `HomeScreen` → `ItemDetails` → `CookingScreen`.
`PageRouteBuilder` gives full control over the transition, and `SlideTransition` was used inside it to slide the new screen in from the right — giving a natural mobile feel.

```dart
Navigator.of(context).push(
  PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 400),
    pageBuilder: (context, animation, secondaryAnimation) => ItemDetails(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween(begin: Offset(1, 0), end: Offset.zero)
            .chain(CurveTween(curve: Curves.easeInOut))
            .animate(animation),
        child: child,
      );
    },
  ),
);
```

**2. `AnimatedContainer` — Tab Switching (Ingredients / Steps)**
> 🟢 Type: **Implicit Animation**

Used in `ItemDetails` screen when switching between the Ingredients and Steps tabs.
Chosen because it smoothly transitions the background color of the selected tab without any extra complexity.

```dart
AnimatedContainer(
  duration: const Duration(milliseconds: 250),
  color: isSelected ? Color(0xFFFF8C00) : Colors.transparent,
  ...
)
```

**3. `AnimatedContainer` — Recipe Card Selection (CookingScreen)**
> 🟢 Type: **Implicit Animation**

Used in `CookingScreen` when the user selects Meat, Tuna, or Pasta.
Chosen because it animates the card's color, border, and shadow all at once with a single widget — no controller needed.

```dart
AnimatedContainer(
  duration: const Duration(milliseconds: 250),
  decoration: BoxDecoration(
    color: isSelected ? mainColor : Colors.white,
    border: Border.all(color: isSelected ? mainColor : Colors.grey),
  ),
  ...
)
```

### Animations Researched but NOT Used

| Animation | Type | Reason Not Used |
|-----------|------|----------------|
| `Hero` | Implicit | Would require matching tags across screens — added complexity for minimal visual gain |
| `FadeTransition` | Explicit | Slide felt more natural for this app's navigation style |
| `ScaleTransition` | Explicit | Too flashy for a simple card selection interaction |
| `AnimatedOpacity` | Implicit | Was used briefly then removed to keep the UI simpler |

---

## 🎥 App Demo


https://drive.google.com/drive/folders/1_Q069yYX3YVeV-g1o-BwHB-mCE_G6VIe?usp=drive_link



---

> Made with ❤️ and Flutter
