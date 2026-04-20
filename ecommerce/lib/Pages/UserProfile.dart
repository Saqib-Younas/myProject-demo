import '/components/MenuItem.dart';
import '/components/ProfileHeader.dart';
import '/components/SectionHeader.dart';
import '/components/SetItem.dart';
import '/components/SwitchComponent.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'user_profile_model.dart';
export 'user_profile_model.dart';

class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget({super.key});

  static String routeName = 'UserProfile';
  static String routePath = '/userProfile';

  @override
  State<UserProfileWidget> createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  late UserProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserProfileModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 16),
                      child: Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FlutterFlowIconButton(
                              borderRadius: 8,
                              buttonSize: 40,
                              fillColor: Colors.transparent,
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                            Text(
                              'My Profile',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                    lineHeight: 1.4,
                                  ),
                            ),
                            FlutterFlowIconButton(
                              borderRadius: 8,
                              buttonSize: 40,
                              fillColor: Colors.transparent,
                              icon: Icon(
                                Icons.settings_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 1,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ],
                ),
              ),
              wrapWithModel(
                model: _model.profileHeaderModel,
                updateCallback: () => safeSetState(() {}),
                child: ProfileHeaderWidget(
                  email: 'alex.rivera@premium.com',
                  name: 'Alex Rivera',
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                child: Container(
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(24),
                      shape: BoxShape.rectangle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: wrapWithModel(
                                model: _model.statItemModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: StatItemWidget(
                                  label: 'Orders',
                                  value: '12',
                                ),
                              ),
                            ),
                            Container(
                              width: 1,
                              height: 30,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: wrapWithModel(
                                model: _model.statItemModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: StatItemWidget(
                                  label: 'Wishlist',
                                  value: '5',
                                ),
                              ),
                            ),
                            Container(
                              width: 1,
                              height: 30,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: wrapWithModel(
                                model: _model.statItemModel3,
                                updateCallback: () => safeSetState(() {}),
                                child: StatItemWidget(
                                  label: 'Points',
                                  value: '2.4k',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.sectionHeaderModel1,
                updateCallback: () => safeSetState(() {}),
                child: SectionHeaderWidget(
                  show_all: false,
                  title: 'Account Settings',
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    wrapWithModel(
                      model: _model.menuItemModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: MenuItemWidget(
                        bg_color: Color(0xFFE3F2FD),
                        has_subtitle: true,
                        icon: Icon(
                          Icons.shopping_bag_outlined,
                          color: Color(0xFF1976D2),
                          size: 22,
                        ),
                        icon_color: Color(0xFF1976D2),
                        subtitle: 'Track, return, or buy again',
                        target: 'navigate:OrderSuccess',
                        title: 'My Orders',
                      ),
                    ),
                    wrapWithModel(
                      model: _model.menuItemModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: MenuItemWidget(
                        bg_color: Color(0xFFFCE4EC),
                        has_subtitle: true,
                        icon: Icon(
                          Icons.favorite_border_rounded,
                          color: Color(0xFFD81B60),
                          size: 22,
                        ),
                        icon_color: Color(0xFFD81B60),
                        subtitle: 'Your favorite premium items',
                        target: 'navigate:OrderSuccess',
                        title: 'Wishlist',
                      ),
                    ),
                    wrapWithModel(
                      model: _model.menuItemModel3,
                      updateCallback: () => safeSetState(() {}),
                      child: MenuItemWidget(
                        bg_color: Color(0xFFE8F5E9),
                        has_subtitle: true,
                        icon: Icon(
                          Icons.account_balance_wallet_outlined,
                          color: Color(0xFF388E3C),
                          size: 22,
                        ),
                        icon_color: Color(0xFF388E3C),
                        subtitle: 'Visa â¢â¢â¢â¢ 4242',
                        target: 'navigate:OrderSuccess',
                        title: 'Payment Methods',
                      ),
                    ),
                    wrapWithModel(
                      model: _model.menuItemModel4,
                      updateCallback: () => safeSetState(() {}),
                      child: MenuItemWidget(
                        bg_color: Color(0xFFFFF3E0),
                        has_subtitle: true,
                        icon: Icon(
                          Icons.location_on_outlined,
                          color: Color(0xFFF57C00),
                          size: 22,
                        ),
                        icon_color: Color(0xFFF57C00),
                        subtitle: '3 saved addresses',
                        target: 'navigate:OrderSuccess',
                        title: 'Shipping Addresses',
                      ),
                    ),
                  ],
                ),
              ),
              wrapWithModel(
                model: _model.sectionHeaderModel2,
                updateCallback: () => safeSetState(() {}),
                child: SectionHeaderWidget(
                  show_all: false,
                  title: 'Preferences',
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Container(
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(24),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF3E5F5),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          shape: BoxShape.rectangle,
                                        ),
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Icon(
                                          Icons.dark_mode_outlined,
                                          color: Color(0xFF7B1FA2),
                                          size: 22,
                                        ),
                                      ),
                                      Text(
                                        'Dark Mode',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontStyle,
                                              lineHeight: 1.6,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 16)),
                                  ),
                                  wrapWithModel(
                                    model: _model.switchComponentModel1,
                                    updateCallback: () => safeSetState(() {}),
                                    child: SwitchComponentWidget(
                                      label: false,
                                      variant: 'iOS',
                                      active: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Container(
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(24),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFE0F2F1),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          shape: BoxShape.rectangle,
                                        ),
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Icon(
                                          Icons.notifications_outlined,
                                          color: Color(0xFF00796B),
                                          size: 22,
                                        ),
                                      ),
                                      Text(
                                        'Push Notifications',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontStyle,
                                              lineHeight: 1.6,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 16)),
                                  ),
                                  wrapWithModel(
                                    model: _model.switchComponentModel2,
                                    updateCallback: () => safeSetState(() {}),
                                    child: SwitchComponentWidget(
                                      label: false,
                                      variant: 'iOS',
                                      active: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              wrapWithModel(
                model: _model.sectionHeaderModel3,
                updateCallback: () => safeSetState(() {}),
                child: SectionHeaderWidget(
                  show_all: false,
                  title: 'Management',
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    wrapWithModel(
                      model: _model.menuItemModel5,
                      updateCallback: () => safeSetState(() {}),
                      child: MenuItemWidget(
                        bg_color: Color(0xFFEDE7F6),
                        has_subtitle: true,
                        icon: Icon(
                          Icons.dashboard_customize_outlined,
                          color: Color(0xFF512DA8),
                          size: 22,
                        ),
                        icon_color: Color(0xFF512DA8),
                        subtitle: 'View store analytics',
                        target: 'navigate:AdminDashboard',
                        title: 'Admin Dashboard',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(24),
                child: Container(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).error30,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Container(
                        child: Container(
                          alignment: AlignmentDirectional(0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.logout_rounded,
                                color: FlutterFlowTheme.of(context).error,
                                size: 20,
                              ),
                              Text(
                                'Log Out',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context).error,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                      lineHeight: 1.6,
                                    ),
                              ),
                            ].divide(SizedBox(width: 8)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
