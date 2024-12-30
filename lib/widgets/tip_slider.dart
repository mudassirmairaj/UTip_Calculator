import 'package:flutter/material.dart';

class TipSlider extends StatelessWidget {
  const TipSlider({
    super.key,
    required double tipPercentage,
    required this.onChanged,
  }) : _tipPercentage = tipPercentage;

  final double _tipPercentage;
  final ValueChanged<double> onChanged;
  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 0.0,
      max: 0.5,
      label: '${(_tipPercentage * 100).round()}',
      value: _tipPercentage,
      // onChanged: (value) {
      //   onChanged(value);
      // },
      onChanged: onChanged,
    );
  }
}
