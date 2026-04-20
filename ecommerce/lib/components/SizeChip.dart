import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'size_chip_model.dart';
export 'size_chip_model.dart';

class SizeChipWidget extends StatefulWidget {
  const SizeChipWidget({
    super.key,
    String? label,
    bool? selected,
  })  : this.label = label ?? 'S',
        this.selected = selected ?? false;

  final String label;
  final bool selected;

  @override
  State<SizeChipWidget> createState() => _SizeChipWidgetState();
}

class _SizeChipWidgetState extends State<SizeChipWidget> {
  late SizeChipModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SizeChipModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 60,
      ),
      decoration: BoxDecoration(
        color: widget!.selected
            ? FlutterFlowTheme.of(context).primary
            : FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(16),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: widget!.selected
              ? FlutterFlowTheme.of(context).primary
              : FlutterFlowTheme.of(context).alternate,
          width: widget!.selected ? 1.0 : 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8, 16, 8, 16),
        child: Container(
          child: Container(
            alignment: AlignmentDirectional(0, 0),
            child: Text(
              valueOrDefault<String>(
                widget!.label,
                'S',
              ),
              style: FlutterFlowTheme.of(context).labelLarge.override(
                    font: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelLarge.fontStyle,
                    ),
                    color: widget!.selected
                        ? FlutterFlowTheme.of(context).onPrimary
                        : FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelLarge.fontStyle,
                    lineHeight: 1.3,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
