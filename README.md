# 🎨 Flutter Theme & Color System (Single Brand + Cubit)

## 🧭 Overview

This project provides a **centralized, code-generated theme and color system for Flutter applications**, enhanced with **Cubit-based runtime control** for theme mode changes.

Its primary goals are to:

- enforce visual consistency
- eliminate manual color duplication
- provide a single source of truth for colors
- support **light / dark switching at runtime**
- keep widgets free from theme logic

The system is based on:

- 🗂️ **JSON-based color tokens** (single brand)
- ⚙️ **Build-time code generation** (no runtime parsing)
- 🎯 **Typed integration with `ThemeData`**
- 🎛️ **ThemeCubit** to control theme mode

This approach is ideal for design-system–driven applications that use one brand but still require a clean, scalable theming solution.

👉 For a full multi-brand implementation (multiple brands, shared token schema, and runtime brand switching), see:
https://github.com/Abdo-Nabil/multi_theme_token_approach

---

## 🏗️ High-Level Architecture

The system is structured around **four responsibilities**:

1. 🎨 **Color Definition** – Declarative JSON tokens
2. 🛠️ **Code Generation** – Dart files generated at build time
3. 🧩 **Theme Integration** – Tokens exposed via Flutter theming
4. 🎛️ **Runtime Control** – Cubit manages theme mode changes

```
colors.json
   ↓
[theme_generator.dart]
   ↓
app_colors.g.dart
   ↓
context_colors.dart / app_theme.dart
   ↓
ThemeCubit (ThemeMode)
   ↓
Flutter Widgets
```

---

## 📁 Folder & File Responsibilities

```
lib/
  theme/
    design_tokens/
      colors.json              # 🎨 Single brand tokens

    theme_generator.dart       # ⚙️ Build-time generator

    app_colors.g.dart          # 🤖 AUTO-GENERATED

    context_colors.dart

    cubit/
      theme_cubit.dart
      theme_state.dart

    app_theme.dart
```

---

## 🎨 `colors.json`

The **single source of truth** for all application colors.

Each token must define **light** and **dark** variants.

Example:

```json
{
  "pageBg": {
    "light": "#F5F5F5",
    "dark": "#121212"
  },
  "pageFg": {
    "light": "#121212",
    "dark": "#EDEDED"
  }
}
```

---

## ⚙️ `theme_generator.dart`

A **build-time utility script** responsible for:

- reading `design_tokens/colors.json`
- validating token structure
- generating strongly-typed Dart color APIs

Run manually or in CI:

```bash
dart lib/theme/theme_generator.dart
```

---

## 🧬 `app_colors.g.dart` (Generated)

⚠️ **Auto-generated — do not edit manually**

Contains:

- `AppColors extends ThemeExtension<AppColors>`
- typed color fields
- automatic light/dark resolution

---

## 🎛️ ThemeCubit (Runtime Control)

The `ThemeCubit` controls **only theme mode**:

- `ThemeMode.system`
- `ThemeMode.light`
- `ThemeMode.dark`

It does **not** build themes or access tokens.

---

## 🧾 Summary

This project provides a **robust, maintainable theming foundation** for Flutter applications using design tokens, build-time generation, and Cubit-based runtime control.
