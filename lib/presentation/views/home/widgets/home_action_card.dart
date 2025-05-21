import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeActionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String? svgIconPath;
  final String description;
  final VoidCallback onTap;
  final ColorScheme colorScheme;

  const HomeActionCard({
    super.key,
    required this.title,
    required this.icon,
    this.svgIconPath,
    required this.description,
    required this.onTap,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: colorScheme.primaryContainer.withValues(alpha: 0.3),
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Title and action button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.chevron_right),
                    color: colorScheme.primary,
                    onPressed: onTap,
                  ),
                ],
              ),
              // Central icon
              Expanded(
                child: Center(
                  child: svgIconPath != null && svgIconPath!.isNotEmpty
                      ? SvgPicture.asset(
                          svgIconPath!,
                          width: 56,
                          height: 56,
                          colorFilter: ColorFilter.mode(
                            colorScheme.primary,
                            BlendMode.srcIn,
                          ),
                        )
                      : Icon(icon, size: 56, color: colorScheme.primary),
                ),
              ),
              // Bottom description
              Text(
                description,
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 14,
                  color: colorScheme.onSurface.withAlpha(128),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
