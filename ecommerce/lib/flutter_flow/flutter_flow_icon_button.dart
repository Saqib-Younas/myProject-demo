// Placeholder for FlutterFlow icon button
import 'package:flutter/material.dart';

class FlutterFlowIconButton extends StatelessWidget {
  const FlutterFlowIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.buttonSize,
    this.fillColor,
    this.disabledColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.isOverButton = false,
  });

  final Widget icon;
  final VoidCallback? onPressed;
  final Color? borderColor;
  final double? borderRadius;
  final double? borderWidth;
  final double? buttonSize;
  final Color? fillColor;
  final Color? disabledColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final bool isOverButton;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: onPressed,
      iconSize: buttonSize ?? 24,
      color: fillColor,
      style: IconButton.styleFrom(
        backgroundColor: fillColor,
        foregroundColor: fillColor,
        disabledBackgroundColor: disabledColor,
        hoverColor: hoverColor,
        highlightColor: highlightColor,
        splashFactory: InkSplash.splashFactory,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          side: borderColor != null ? BorderSide(color: borderColor!, width: borderWidth ?? 1) : BorderSide.none,
        ),
      ),
    );
  }
}