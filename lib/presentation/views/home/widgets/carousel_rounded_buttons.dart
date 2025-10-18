import 'package:flutter/material.dart';

class CarouselRoundedButtons extends StatelessWidget {
  final List<CarouselRoundedButtonItem> items;
  final double iconSize;
  final double circleSize;
  final double spacing;

  const CarouselRoundedButtons({
    super.key,
    required this.items,
    this.iconSize = 24,
    this.circleSize = 56,
    this.spacing = 12,
  });

  @override
  Widget build(BuildContext context) {
    // Estimate label height: fontSize 12 with height 1.4 and 2 max lines
  const double labelFontSize = 12.0;
  const double labelLineHeight = 1.4;
  const int labelMaxLines = 2;
  final double labelHeight = labelFontSize * labelLineHeight * labelMaxLines;
    final double totalHeight = circleSize + 8 + labelHeight; // circle + spacing + label

    return SizedBox(
      width: double.infinity,
      height: totalHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemBuilder: (context, index) {
          final item = items[index];
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: item.onTap,
                child: Container(
                  width: circleSize,
                  height: circleSize,
                  decoration: BoxDecoration(
                    color:
                        item.backgroundColor ??
                        Theme.of(context).colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      item.icon,
                      size: iconSize,
                      color:
                          item.iconColor ??
                          Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ),
                const SizedBox(height: 8),
              SizedBox(
                width: circleSize + 8,
                child: Text(
                  item.label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: spacing),
        itemCount: items.length,
      ),
    );
  }
}

class CarouselRoundedButtonItem {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? iconColor;

  CarouselRoundedButtonItem({
    required this.icon,
    required this.label,
    this.onTap,
    this.backgroundColor,
    this.iconColor,
  });
}
