import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xffa24000),
      surfaceTint: Color(0xffa24000),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xfffc6804),
      onPrimaryContainer: Color(0xff541e00),
      secondary: Color(0xff865300),
      onSecondary: Color.fromARGB(255, 106, 52, 52),
      secondaryContainer: Color(0xfffea203),
      onSecondaryContainer: Color(0xff673f00),
      tertiary: Color(0xff040505),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff1e1e1e),
      onTertiaryContainer: Color(0xff878585),
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
      inversePrimary: Color(0xffffb695),
      primaryFixed: Color(0xffffdbcc),
      onPrimaryFixed: Color(0xff351000),
      primaryFixedDim: Color(0xffffb695),
      onPrimaryFixedVariant: Color(0xff7b2f00),
      secondaryFixed: Color(0xffffddb8),
      onSecondaryFixed: Color(0xff2b1700),
      secondaryFixedDim: Color(0xffffb961),
      onSecondaryFixedVariant: Color(0xff663e00),
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

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff602300),
      surfaceTint: Color(0xffa24000),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffb94a00),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4f2f00),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff9a6000),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff040505),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff1e1e1e),
      onTertiaryContainer: Color(0xffaba9a8),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff1b0e08),
      onSurfaceVariant: Color(0xff483127),
      outline: Color(0xff664d41),
      outlineVariant: Color(0xff83675b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff3d2d26),
      inversePrimary: Color(0xffffb695),
      primaryFixed: Color(0xffb94a00),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff923900),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff9a6000),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff794a00),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff6e6d6c),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff555454),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdbc1b7),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1ec),
      surfaceContainer: Color(0xfffee3d8),
      surfaceContainerHigh: Color(0xfff2d7cd),
      surfaceContainerHighest: Color(0xffe6ccc2),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff501c00),
      surfaceTint: Color(0xffa24000),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff7f3000),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff412600),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff694000),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff040505),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff1e1e1e),
      onTertiaryContainer: Color(0xffd5d2d2),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff3c271d),
      outlineVariant: Color(0xff5c4439),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff3d2d26),
      inversePrimary: Color(0xffffb695),
      primaryFixed: Color(0xff7f3000),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff5b2000),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff694000),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff4a2c00),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff494949),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff333232),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffccb4aa),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffffede6),
      surfaceContainer: Color(0xfff8ddd2),
      surfaceContainerHigh: Color(0xffe9cfc5),
      surfaceContainerHighest: Color(0xffdbc1b7),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb695),
      surfaceTint: Color(0xffffb695),
      onPrimary: Color(0xff571f00),
      primaryContainer: Color(0xfffc6804),
      onPrimaryContainer: Color(0xff541e00),
      secondary: Color(0xffffc888),
      onSecondary: Color(0xff472a00),
      secondaryContainer: Color(0xfffea203),
      onSecondaryContainer: Color(0xff673f00),
      tertiary: Color(0xffc8c6c5),
      onTertiary: Color(0xff303030),
      tertiaryContainer: Color(0xff1e1e1e),
      onTertiaryContainer: Color(0xff878585),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff1d100a),
      onSurface: Color(0xfff8ddd2),
      onSurfaceVariant: Color(0xffe2bfb1),
      outline: Color(0xffa98a7d),
      outlineVariant: Color(0xff5a4136),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff8ddd2),
      inversePrimary: Color(0xffa24000),
      primaryFixed: Color(0xffffdbcc),
      onPrimaryFixed: Color(0xff351000),
      primaryFixedDim: Color(0xffffb695),
      onPrimaryFixedVariant: Color(0xff7b2f00),
      secondaryFixed: Color(0xffffddb8),
      onSecondaryFixed: Color(0xff2b1700),
      secondaryFixedDim: Color(0xffffb961),
      onSecondaryFixedVariant: Color(0xff663e00),
      tertiaryFixed: Color(0xffe5e2e1),
      onTertiaryFixed: Color(0xff1b1b1c),
      tertiaryFixedDim: Color(0xffc8c6c5),
      onTertiaryFixedVariant: Color(0xff474746),
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

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd3c1),
      surfaceTint: Color(0xffffb695),
      onPrimary: Color(0xff461700),
      primaryContainer: Color(0xfffc6804),
      onPrimaryContainer: Color(0xff040100),
      secondary: Color(0xffffd5a7),
      onSecondary: Color(0xff382000),
      secondaryContainer: Color(0xfffea203),
      onSecondaryContainer: Color(0xff3f2400),
      tertiary: Color(0xffdedcdb),
      onTertiary: Color(0xff262626),
      tertiaryContainer: Color(0xff929090),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1d100a),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfff9d5c6),
      outline: Color(0xffccab9d),
      outlineVariant: Color(0xffa98a7d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff8ddd2),
      inversePrimary: Color(0xff7d3000),
      primaryFixed: Color(0xffffdbcc),
      onPrimaryFixed: Color(0xff240800),
      primaryFixedDim: Color(0xffffb695),
      onPrimaryFixedVariant: Color(0xff602300),
      secondaryFixed: Color(0xffffddb8),
      onSecondaryFixed: Color(0xff1c0e00),
      secondaryFixedDim: Color(0xffffb961),
      onSecondaryFixedVariant: Color(0xff4f2f00),
      tertiaryFixed: Color(0xffe5e2e1),
      onTertiaryFixed: Color(0xff111111),
      tertiaryFixedDim: Color(0xffc8c6c5),
      onTertiaryFixedVariant: Color(0xff363636),
      surfaceDim: Color(0xff1d100a),
      surfaceBright: Color(0xff524139),
      surfaceContainerLowest: Color(0xff0f0502),
      surfaceContainerLow: Color(0xff281a14),
      surfaceContainer: Color(0xff34241e),
      surfaceContainerHigh: Color(0xff3f2f28),
      surfaceContainerHighest: Color(0xff4b3a33),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffece5),
      surfaceTint: Color(0xffffb695),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffb08c),
      onPrimaryContainer: Color(0xff1b0500),
      secondary: Color(0xffffeddc),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffffb352),
      onSecondaryContainer: Color(0xff140900),
      tertiary: Color(0xfff2efef),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffc4c2c2),
      onTertiaryContainer: Color(0xff0b0b0b),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff1d100a),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffffece5),
      outlineVariant: Color(0xffdebbad),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff8ddd2),
      inversePrimary: Color(0xff7d3000),
      primaryFixed: Color(0xffffdbcc),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb695),
      onPrimaryFixedVariant: Color(0xff240800),
      secondaryFixed: Color(0xffffddb8),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffffb961),
      onSecondaryFixedVariant: Color(0xff1c0e00),
      tertiaryFixed: Color(0xffe5e2e1),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffc8c6c5),
      onTertiaryFixedVariant: Color(0xff111111),
      surfaceDim: Color(0xff1d100a),
      surfaceBright: Color(0xff5f4c44),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff2b1c16),
      surfaceContainer: Color(0xff3d2d26),
      surfaceContainerHigh: Color(0xff493830),
      surfaceContainerHighest: Color(0xff55433b),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
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
