import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator_app/component/colors.dart';
import 'package:flutter/material.dart';

Widget numberButton(String data) {
  return AutoSizeText(
    data,
    style: const TextStyle(fontSize: 40, color: AppColors.buttonNumColors),
    presetFontSizes: const [40, 30, 25],
  );
}

Widget symbolTextButton(String data) {
  return AutoSizeText(
    data,
    style: const TextStyle(
      fontSize: 60,
      color: AppColors.buttonUnNumColors,
    ),
    presetFontSizes: const [60, 40, 24],
  );
}

Widget trignometricSymbols(String data) {
  return AutoSizeText(
    data,
    style: const TextStyle(fontSize: 25, color: AppColors.buttonUnNumColors),
    presetFontSizes: const [25, 20, 15],
  );
}
