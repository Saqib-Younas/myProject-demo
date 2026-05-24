import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'payment_option_model.dart';
export 'payment_option_model.dart';

class PaymentOptionWidget extends StatefulWidget {
  const PaymentOptionWidget({
    super.key,
    String? logo,
    String? name,
    bool? selected,
  })  : this.logo = logo ?? 'https://cdn.simpleicons.org/applepay/0f172a.svg',
        this.name = name ?? 'Apple Pay',
        this.selected = selected ?? true;

  final String logo;
  final String name;
  final bool selected;

  @override
  State<PaymentOptionWidget> createState() => _PaymentOptionWidgetState();
}

class _PaymentOptionWidgetState extends State<PaymentOptionWidget> {
  late PaymentOptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentOptionModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
      child: Container(
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(24),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: widget!.selected
                  ? FlutterFlowTheme.of(context).primary
                  : FlutterFlowTheme.of(context).alternate,
              width: widget!.selected ? 1.0 : 1.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 48,
                    height: 32,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(2),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 1,
                      ),
                    ),
                    alignment: AlignmentDirectional(0, 0),
                    child: SvgPicture.network(
                      valueOrDefault<String>(
                        widget!.logo,
                        'https://cdn.simpleicons.org/applepay/0f172a.svg',
                      ),
                      width: 24,
                      height: 24,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      valueOrDefault<String>(
                        widget!.name,
                        'Apple Pay',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                            lineHeight: 1.5,
                          ),
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    child: Stack(
                      alignment: AlignmentDirectional(0, 0),
                      children: [
                        if (widget!.selected ? true : false)
                          Icon(
                            Icons.radio_button_checked_rounded,
                            color: widget!.selected
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context).alternate,
                            size: 20,
                          ),
                        if (widget!.selected ? false : true)
                          Icon(
                            Icons.radio_button_unchecked_rounded,
                            color: widget!.selected
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context).alternate,
                            size: 20,
                          ),
                      ],
                    ),
                  ),
                ].divide(SizedBox(width: 16)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
