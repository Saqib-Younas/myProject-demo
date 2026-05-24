import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'color_option_model.dart';
export 'color_option_model.dart';

class ColorOptionWidget extends StatefulWidget {
  const ColorOptionWidget({
    super.key,
    Color? color_hex,
    bool? selected,
  })  : this.color_hex = color_hex ?? const Color(0xFF2C2C2C),
        this.selected = selected ?? true;

  final Color color_hex;
  final bool selected;

  @override
  State<ColorOptionWidget> createState() => _ColorOptionWidgetState();
}

class _ColorOptionWidgetState extends State<ColorOptionWidget> {
  late ColorOptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ColorOptionModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9999),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: widget!.selected
              ? FlutterFlowTheme.of(context).primary
              : Colors.transparent,
          width: widget!.selected ? 2.0 : 2.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(2),
        child: Container(
          child: Container(
            decoration: BoxDecoration(
              color: valueOrDefault<Color>(
                widget!.color_hex,
                Color(0xFF2C2C2C),
              ),
              borderRadius: BorderRadius.circular(9999),
              shape: BoxShape.rectangle,
            ),
          ),
        ),
      ),
    );
  }
}
