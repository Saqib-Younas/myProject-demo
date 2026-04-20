import 'package:flutter/material.dart';

class DetailRowWidget extends StatelessWidget {
  const DetailRowWidget({
    Key? key,
    this.label,
    this.value,
  }) : super(key: key);

  final String? label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label ?? ''),
        Text(value ?? ''),
      ],
    );
  }
}
