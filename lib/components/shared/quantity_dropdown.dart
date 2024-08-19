import 'package:ecommerce_application/app/app_config.dart';
import 'package:flutter/material.dart';

class QuantityDropdown extends StatefulWidget {
  const QuantityDropdown({super.key});

  @override
  _QuantityDropdownState createState() => _QuantityDropdownState();
}

class _QuantityDropdownState extends State<QuantityDropdown> {
  int? _selectedQuantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppConfig.scaffoldPadding / 2, vertical: 0),
      decoration: BoxDecoration(
        border: Border.all(
            color: AppConfig.secondary, width: 1), // Border color and width
        borderRadius:
            BorderRadius.circular(AppConfig.globalRadius), // Border radius
      ),
      child: DropdownButton<int>(
        icon: const Icon(Icons.keyboard_arrow_down),
        menuMaxHeight: 300,
        itemHeight: null,
        underline: const SizedBox.shrink(),
        hint: const Text('Select Quantity'),
        value: _selectedQuantity,
        items: List.generate(30, (index) => index + 1).map((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text('$value'),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            _selectedQuantity = newValue;
          });
        },
        selectedItemBuilder: (BuildContext context) {
          return List.generate(30, (index) {
            return Align(
              alignment: Alignment.center,
              child: Text(
                _selectedQuantity != null
                    ? 'Quantity: $_selectedQuantity'
                    : 'Select Quantity',
              ),
            );
          });
        },
      ),
    );
  }
}
