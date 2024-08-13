import 'package:ecommerce_application/app/app_config.dart';
import 'package:ecommerce_application/app/themes.dart';
import 'package:ecommerce_application/components/checkbox/checkbox_text.dart';
import 'package:ecommerce_application/components/line/horizontal_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductCartDetails extends StatefulWidget {
  ProductCartDetails({super.key});

  @override
  _ProductCartDetailsState createState() => _ProductCartDetailsState();
}

class _ProductCartDetailsState extends State<ProductCartDetails> {
  final double sizedBoxHeight = AppConfig.sizedBoxHeight;
  final double subHeadingFontSize = AppConfig.subHeadingFontSize;
  final FontWeight subHeadingFontWeight = AppConfig.subHeadingFontWeight;
  final double headingFontSize = AppConfig.headingFontSize;
  final FontWeight headingFontWeight = AppConfig.headingFontWeight;
  final double globalRadius = AppConfig.globalRadius;
  final double productCartDetailsHeight = AppConfig.productCartDetailsHeight;
  int _quantity = 1;
  final double _price = 19.99;
  final List<String> dropdownItems = [
    '1',
    '2',
    '3',
    '4',
  ];
  String? selectedValue;

  bool _isSelectAll = false;
  void _selectAll(bool? value) {
    setState(() {
      _isSelectAll = value ?? false;
    });
  }

  void _increaseQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decreaseQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CheckboxText(
            isSelectAll: _isSelectAll,
            onSelectAllChanged: _selectAll,
            sizedBoxHeight: sizedBoxHeight / 2,
            fontSize: subHeadingFontSize,
            fontWeight: subHeadingFontWeight,
          ),
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.delete_outline),
            color: Theme.of(context).colorScheme.primary,
          )
        ],
      ),
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
                  Text(
                    "Amazon",
                    style: TextStyle(
                        fontSize: headingFontSize, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: sizedBoxHeight / 2,
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
                    itemSize: 24.0,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Text(
                  'Quantity:',
                  style: TextStyle(
                      fontSize: subHeadingFontSize,
                      fontWeight: headingFontWeight),
                ),
                SizedBox(
                  width: scaffoldPadding,
                ),
                SizedBox(
                  width: 40,
                  child: DropdownButton<String>(
                    value: selectedValue,
                    items: dropdownItems.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedValue = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Text(
            '\$${_price.toStringAsFixed(2)}',
            style: TextStyle(
                fontSize: subHeadingFontSize, fontWeight: headingFontWeight),
          ),
        ],
      ),
      HorizontalLine(
        thickness: 6,
      )
    ]);
  }
}
