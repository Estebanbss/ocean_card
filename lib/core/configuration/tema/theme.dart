import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xfffea203), // Yellow (antes secondary)
      surfaceTint: Color(0xfffea203),
      onPrimary: Color(0xff673f00),
      primaryContainer: Color(0xffffddb8),
      onPrimaryContainer: Color(0xff2b1700),
      secondary: Color(0xfffc6804), // Orange (antes primary)
      onSecondary: Color(0xff541e00),
      secondaryContainer: Color(0xffffdbcc),
      onSecondaryContainer: Color(0xff351000),
      tertiary: Color(0xff1e1e1e),
      onTertiary: Color(0xff878585),
      tertiaryContainer: Color(0xff040505),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff261812),
      onSurfaceVariant: Color(0xff5a4136),
      outline: Color(0xff8e7164),
      outlineVariant: Color(0xffe2bfb1),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff3d2d26),
      inversePrimary: Color(0xffb97a00),
      primaryFixed: Color(0xffffddb8),
      onPrimaryFixed: Color(0xff2b1700),
      primaryFixedDim: Color(0xffb97a00),
      onPrimaryFixedVariant: Color(0xff663e00),
      secondaryFixed: Color(0xffffdbcc),
      onSecondaryFixed: Color(0xff351000),
      secondaryFixedDim: Color(0xffa24000),
      onSecondaryFixedVariant: Color(0xff7b2f00),
      tertiaryFixed: Color(0xffe5e2e1),
      onTertiaryFixed: Color(0xff1b1b1c),
      tertiaryFixedDim: Color(0xffc8c6c5),
      onTertiaryFixedVariant: Color(0xff474746),
      surfaceDim: Color(0xffefd5ca),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1ec),
      surfaceContainer: Color(0xffffe9e1),
      surfaceContainerHigh: Color(0xfffee3d8),
      surfaceContainerHighest: Color(0xfff8ddd2),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb97a00), // Dark yellow (equivalente a primary light)
      surfaceTint: Color(0xffb97a00),
      onPrimary: Color(0xfff8f8f8),
      primaryContainer: Color(0xff7a5a00),
      onPrimaryContainer: Color(0xfff8f8f8),
      secondary: Color(
        0xffa24000,
      ), // Dark orange (equivalente a secondary light)
      onSecondary: Color(0xfff8f8f8),
      secondaryContainer: Color(0xff541e00),
      onSecondaryContainer: Color(0xfff8f8f8),
      tertiary: Color(0xff23272e),
      onTertiary: Color(0xffe0e0e0),
      tertiaryContainer: Color(0xff101214),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff181818),
      onSurface: Color(0xfff8ddd2),
      onSurfaceVariant: Color(0xffe2bfb1),
      outline: Color(0xffa98a7d),
      outlineVariant: Color(0xff5a4136),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff8ddd2),
      inversePrimary: Color(0xfffea203),
      primaryFixed: Color(0xffb97a00),
      onPrimaryFixed: Color(0xfff8f8f8),
      primaryFixedDim: Color(0xff7a5a00),
      onPrimaryFixedVariant: Color(0xfff8f8f8),
      secondaryFixed: Color(0xffa24000),
      onSecondaryFixed: Color(0xfff8f8f8),
      secondaryFixedDim: Color(0xff541e00),
      onSecondaryFixedVariant: Color(0xfff8f8f8),
      tertiaryFixed: Color(0xff23272e),
      onTertiaryFixed: Color(0xffe0e0e0),
      tertiaryFixedDim: Color(0xff101214),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xff1d100a),
      surfaceBright: Color(0xff46362e),
      surfaceContainerLowest: Color(0xff170b06),
      surfaceContainerLow: Color(0xff261812),
      surfaceContainer: Color(0xff2b1c16),
      surfaceContainerHigh: Color(0xff362720),
      surfaceContainerHighest: Color(0xff41312a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
