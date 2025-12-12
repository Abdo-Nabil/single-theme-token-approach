# 🎨 Flutter Theme & Color System

## 🧭 Overview

This project provides a **centralized, code-generated theme and color system for Flutter applications**.  
Its primary goal is to enforce visual consistency, eliminate manual color duplication, and support light/dark theming from a single source of truth.

The system is based on:

- 🗂️ JSON-based color definitions
- ⚙️ A build-time generator that produces strongly-typed Dart code
- 🎯 Direct integration with Flutter’s `ThemeData`

This approach is ideal for **design-system–driven applications** and scales cleanly as the number of colors grows.

---

## 🏗️ High-Level Architecture

The system is structured around three responsibilities:

1. 🎨 **Color Definition** – Declarative JSON tokens
2. 🛠️ **Code Generation** – Dart files generated at build time
3. 🧩 **Theme Integration** – Tokens exposed through Flutter theming

```
colors.json
   ↓
[theme_generator.dart]
   ↓
app_colors.g.dart
   ↓
context_colors.dart / app_theme.dart
   ↓
Flutter Widgets
```

---

## 📁 Folder & File Responsibilities

### 🗂️ `colors.json`

The **single source of truth** for all application colors.  
Each color must define **light** and **dark** variants.

Example:

```json
{
  "pageBg": {
    "light": "#F5F5F5",
    "dark": "#121212"
  }
}
```

Rules:

- Keys must be valid Dart identifiers
- Values must be hex color strings
- Both `light` and `dark` values are required

---

### ⚙️ `theme_generator.dart`

A build-time utility script responsible for:

- Reading `design_tokens/colors.json`
- Validating token structure
- Generating strongly-typed Dart color APIs

This script is **not used at runtime**.

Usage:

```bash
dart lib/theme/theme_generator.dart
```

---

### 🧬 `app_colors.g.dart` (Generated)

⚠️ **Auto-generated — do not edit manually**

Contains:

- Typed color fields
- Light & dark color mappings
- Compile-time safety

---

### 🧩 `context_colors.dart`

Provides ergonomic access to colors via `BuildContext`.

```dart
final colors = context.colors;
```

---

### 🎯 `app_theme.dart`

Defines the application-level `ThemeData`.

---

## 🛠️ How to Use

1. Edit `colors.json`
2. Run the generator
3. Run the Flutter app

---

## 🧾 Summary

This project provides a **robust, maintainable, and scalable theming foundation** for Flutter applications using design tokens and code generation.
