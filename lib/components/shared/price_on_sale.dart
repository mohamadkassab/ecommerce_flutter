import 'package:ecommerce_application/app/app_config.dart';
import 'package:flutter/material.dart';

enum PriceLayout { row, column }

class PriceOnSale extends StatelessWidget {
  final double priceBefore;
  final double priceAfter;
  final PriceLayout layout;

  const PriceOnSale({super.key, 
    required this.priceBefore,
    required this.priceAfter,
    this.layout = PriceLayout.column,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final secondaryColor = theme.colorScheme.secondary;
    final primaryColor = theme.colorScheme.primary;

    return layout == PriceLayout.row
        ? Padding(
            padding: const EdgeInsets.only(left: AppConfig.scaffoldPadding / 2),
            child: Row(
              children: [
                Text(
                  '\$${priceAfter.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: AppConfig.subHeadingFontSize,
                    fontWeight: AppConfig.headingFontWeight,
                  ),
                ),
                const SizedBox(width: 8), // Space between the prices

                Text(
                  '\$${priceBefore.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: AppConfig.headingFontSize,
                    fontWeight: AppConfig.headingFontWeight,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: secondaryColor,
                  ),
                ),
              ],
            ),
          )
        : Column(
            children: [
              Text(
                '\$${priceBefore.toStringAsFixed(2)}',
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: AppConfig.headingFontSize,
                  fontWeight: AppConfig.headingFontWeight,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: secondaryColor,
                ),
              ),
              Text(
                '\$${priceAfter.toStringAsFixed(2)}',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: AppConfig.subHeadingFontSize,
                  fontWeight: AppConfig.headingFontWeight,
                ),
              ),
            ],
          );
  }
}
