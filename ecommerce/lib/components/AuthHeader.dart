import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'auth_header_model.dart';
export 'auth_header_model.dart';

class AuthHeaderWidget extends StatefulWidget {
  const AuthHeaderWidget({
    super.key,
    String? subtitle,
    String? title,
  })  : this.subtitle = subtitle ??
            'Sign in to access your exclusive deals and track your orders.',
        this.title = title ?? 'Premium Shop';

  final String subtitle;
  final String title;

  @override
  State<AuthHeaderWidget> createState() => _AuthHeaderWidgetState();
}

class _AuthHeaderWidgetState extends State<AuthHeaderWidget> {
  late AuthHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthHeaderModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primary10,
              borderRadius: BorderRadius.circular(24),
              shape: BoxShape.rectangle,
            ),
            alignment: AlignmentDirectional(0, 0),
            child: SvgPicture.network(
              'https://cdn.simpleicons.org/flutter/6366f1.svg',
              width: 32,
              height: 32,
              fit: BoxFit.contain,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                valueOrDefault<String>(
                  widget!.title,
                  'Premium Shop',
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w800,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w800,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                      lineHeight: 1.25,
                    ),
              ),
              Text(
                valueOrDefault<String>(
                  widget!.subtitle,
                  'Sign in to access your exclusive deals and track your orders.',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      lineHeight: 1.5,
                    ),
              ),
            ].divide(SizedBox(height: 4)),
          ),
        ].divide(SizedBox(height: 16)),
      ),
    );
  }
}
