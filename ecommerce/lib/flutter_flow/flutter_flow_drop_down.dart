import 'package:flutter/material.dart';
import 'form_field_controller.dart';

class FlutterFlowDropDown<T> extends StatefulWidget {
  const FlutterFlowDropDown({
    Key? key,
    required this.options,
    this.value,
    this.onChanged,
    this.controller,
    this.hintText,
    this.fillColor,
    this.borderColor,
    this.borderWidth = 1.0,
    this.borderRadius = 8.0,
    this.textStyle,
    this.hintTextStyle,
    this.icon,
    this.elevation = 2.0,
    this.margin = EdgeInsets.zero,
    this.hidesUnderline = false,
    this.width,
    this.height,
  }) : super(key: key);

  final List<T> options;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final FormFieldController<T>? controller;
  final String? hintText;
  final Color? fillColor;
  final Color? borderColor;
  final double borderWidth;
  final double borderRadius;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final Widget? icon;
  final double elevation;
  final EdgeInsetsGeometry margin;
  final bool hidesUnderline;
  final double? width;
  final double? height;

  @override
  _FlutterFlowDropDownState<T> createState() => _FlutterFlowDropDownState<T>();
}

class _FlutterFlowDropDownState<T> extends State<FlutterFlowDropDown<T>> {
  @override
  Widget build(BuildContext context) {
    Widget dropdown = DropdownButtonFormField<T>(
      value: widget.value,
      onChanged: widget.onChanged,
      items: widget.options.map((T value) {
        return DropdownMenuItem<T>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: widget.hintTextStyle,
        filled: widget.fillColor != null,
        fillColor: widget.fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.borderColor ?? Colors.grey,
            width: widget.borderWidth,
          ),
        ),
      ),
      style: widget.textStyle,
      icon: widget.icon,
      elevation: widget.elevation.toInt(),
    );

    if (widget.width != null || widget.height != null) {
      return SizedBox(
        width: widget.width,
        height: widget.height,
        child: dropdown,
      );
    }

    return dropdown;
  }
}