import 'package:ecommerce_application/app/app_config.dart';
import 'package:ecommerce_application/app/theme.dart';
import 'package:ecommerce_application/components/checkbox/checkbox_text.dart';
import 'package:ecommerce_application/components/line/horizontal_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductSearchDetails extends StatefulWidget {
  ProductSearchDetails({super.key});

  @override
  _ProductSearchDetailsState createState() => _ProductSearchDetailsState();
}

class _ProductSearchDetailsState extends State<ProductSearchDetails> {
  final double sizedBoxHeight = AppConfig.sizedBoxHeight;
  final double subHeadingFontSize = AppConfig.subHeadingFontSize;
  final FontWeight subHeadingFontWeight = AppConfig.subHeadingFontWeight;
  final double headingFontSize = AppConfig.headingFontSize;
  final FontWeight headingFontWeight = AppConfig.headingFontWeight;
  final double globalRadius = AppConfig.globalRadius;
  final double productCartDetailsHeight = AppConfig.productCartDetailsHeight;
  final double _price = 19.99;

  String? selectedValue;

  bool _isSelectAll = false;
  void _selectAll(bool? value) {
    setState(() {
      _isSelectAll = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Expanded(
            child: Container(
              height: productCartDetailsHeight,
              child: Image.asset(
                "assets/images/whey.png",
                fit: BoxFit.fitWidth,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(globalRadius)),
              ),
              clipBehavior: Clip.antiAlias,
            ),
          ),
          SizedBox(
            width: sizedBoxHeight / 2,
          ),
          Expanded(
            child: Container(
              height: productCartDetailsHeight,
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Amazon",
                        style: TextStyle(
                            fontSize: headingFontSize,
                            fontWeight: FontWeight.w800),
                      ),
                      IconButton(
                          onPressed: () => {}, icon: Icon(Icons.share_outlined))
                    ],
                  ),
                  Text(
                    "high absorption Magnesium Glycinate 350, 160 veg160 caps bla bla bla",
                    style: TextStyle(
                        fontSize: subHeadingFontSize,
                        fontWeight: subHeadingFontWeight),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: sizedBoxHeight / 2,
                  ),
                  RatingBar.builder(
                    initialRating: 4,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemSize: 20.0,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FittedBox(
                          child: Column(
                            children: [
                              Text(
                                '\$${_price.toStringAsFixed(2)}',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontSize: headingFontSize,
                                    fontWeight: headingFontWeight,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                              ),
                              Text(
                                '\$${_price.toStringAsFixed(2)}',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: subHeadingFontSize,
                                    fontWeight: headingFontWeight),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.shopping_cart_checkout_outlined),
                          color: Theme.of(context).colorScheme.tertiary,
                          onPressed: () {
                            // Add your onPressed code here!
                            print("Cart icon clicked!");
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      HorizontalLine(
        thickness: 6,
      )
    ]);
  }
}
