import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'social_btn_model.dart';
export 'social_btn_model.dart';

class SocialBtnWidget extends StatefulWidget {
  const SocialBtnWidget({
    super.key,
    String? icon,
    String? label,
  })  : this.icon = icon ?? 'https://cdn.simpleicons.org/google/0f172a.svg',
        this.label = label ?? 'Google';

  final String icon;
  final String label;

  @override
  State<SocialBtnWidget> createState() => _SocialBtnWidgetState();
}

class _SocialBtnWidgetState extends State<SocialBtnWidget> {
  late SocialBtnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialBtnModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(24),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1,
        ),
      ),
      alignment: AlignmentDirectional(0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.network(
            valueOrDefault<String>(
              widget!.icon,
              'https://cdn.simpleicons.org/google/0f172a.svg',
            ),
            width: 20,
            height: 20,
            fit: BoxFit.contain,
          ),
          Text(
            valueOrDefault<String>(
              widget!.label,
              'Google',
            ),
            style: FlutterFlowTheme.of(context).labelLarge.override(
                  font: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelLarge.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                  lineHeight: 1.3,
                ),
          ),
        ].divide(SizedBox(width: 8)),
      ),
    );
  }
}
