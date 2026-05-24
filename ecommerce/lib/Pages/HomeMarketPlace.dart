import '/components/Button.dart';
import '/components/CategoryChip.dart';
import '/components/ProductCard.dart';
import '/components/TextField.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'home_marketplace_model.dart';
export 'home_marketplace_model.dart';

class HomeMarketplaceWidget extends StatefulWidget {
  const HomeMarketplaceWidget({super.key});

  static String routeName = 'HomeMarketplace';
  static String routePath = '/homeMarketplace';

  @override
  State<HomeMarketplaceWidget> createState() => _HomeMarketplaceWidgetState();
}

class _HomeMarketplaceWidgetState extends State<HomeMarketplaceWidget> {
  late HomeMarketplaceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeMarketplaceModel());
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
              Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome Back',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                    lineHeight: 1.5,
                                  ),
                            ),
                            Text(
                              'Alex Rivera',
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontStyle,
                                    lineHeight: 1.25,
                                  ),
                            ),
                          ].divide(SizedBox(height: 4)),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(9999),
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9999),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1,
                              ),
                            ),
                            child: CachedNetworkImage(
                              fadeInDuration: Duration(milliseconds: 0),
                              fadeOutDuration: Duration(milliseconds: 0),
                              imageUrl:
                                  'https://dimg.dreamflow.cloud/v1/image/modern%20male%20portrait%20professional',
                              fit: BoxFit.cover,
                              alignment: Alignment(0, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: wrapWithModel(
                            model: _model.textFieldModel,
                            updateCallback: () => safeSetState(() {}),
                            child: TextFieldWidget(
                              label: false,
                              helper: false,
                              hint: 'Search premium products...',
                              value: '',
                              leading_icon: Icon(
                                Icons.search_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 16,
                              ),
                              leading_icon_present: true,
                              trailing_icon_present: false,
                              bg: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              radius: 24.0,
                              variant: 'filled',
                              error: false,
                            ),
                          ),
                        ),
                        Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            borderRadius: BorderRadius.circular(24),
                            shape: BoxShape.rectangle,
                          ),
                          alignment: AlignmentDirectional(0, 0),
                          child: Icon(
                            Icons.tune_rounded,
                            color: FlutterFlowTheme.of(context).onPrimary,
                            size: 24,
                          ),
                        ),
                      ].divide(SizedBox(width: 16)),
                    ),
                  ].divide(SizedBox(height: 24)),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Special Offers',
                          style: FlutterFlowTheme.of(context)
                              .titleLarge
                              .override(
                                font: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .fontStyle,
                                lineHeight: 1.3,
                              ),
                        ),
                        Text(
                          'See All',
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                    lineHeight: 1.3,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 180,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                            child: Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(24),
                                    child: Container(
                                      width: 320,
                                      height: 180,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFF1A1A1A),
                                            Color(0xFF444444)
                                          ],
                                          stops: [0, 1],
                                          begin: AlignmentDirectional(-1, 0),
                                          end: AlignmentDirectional(1, 0),
                                        ),
                                        borderRadius: BorderRadius.circular(24),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Stack(
                                        alignment: AlignmentDirectional(-1, -1),
                                        children: [
                                          Opacity(
                                            opacity: 0.6,
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  Duration(milliseconds: 0),
                                              fadeOutDuration:
                                                  Duration(milliseconds: 0),
                                              imageUrl:
                                                  'https://dimg.dreamflow.cloud/v1/image/minimalist%20high-end%20headphones%20black',
                                              fit: BoxFit.cover,
                                              alignment: Alignment(0, 0),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1, 0),
                                            child: Padding(
                                              padding: EdgeInsets.all(24),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                      shape: BoxShape.rectangle,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 4, 8, 4),
                                                      child: Container(
                                                        child: Text(
                                                          'LIMITED TIME',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .plusJakartaSans(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontStyle,
                                                                lineHeight: 1.2,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    '30% OFF\nPremium Audio',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .interTight(
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .onSurface,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmall
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model.buttonModel1,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: ButtonWidget(
                                                      content: 'Shop Now',
                                                      icon_present: false,
                                                      icon_end_present: false,
                                                      on_tap:
                                                          'navigate:ProductDetails',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .onPrimary,
                                                      variant: 'primary',
                                                      size: 'small',
                                                      full_width: false,
                                                      loading: false,
                                                      disabled: false,
                                                    ),
                                                  ),
                                                ].divide(SizedBox(height: 8)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(24),
                                    child: Container(
                                      width: 320,
                                      height: 180,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            FlutterFlowTheme.of(context)
                                                .secondary
                                          ],
                                          stops: [0, 1],
                                          begin: AlignmentDirectional(-1, 0),
                                          end: AlignmentDirectional(1, 0),
                                        ),
                                        borderRadius: BorderRadius.circular(24),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Stack(
                                        alignment: AlignmentDirectional(-1, -1),
                                        children: [
                                          Opacity(
                                            opacity: 0.5,
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  Duration(milliseconds: 0),
                                              fadeOutDuration:
                                                  Duration(milliseconds: 0),
                                              imageUrl:
                                                  'https://dimg.dreamflow.cloud/v1/image/modern%20smart%20watch%20luxury',
                                              fit: BoxFit.cover,
                                              alignment: Alignment(0, 0),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1, 0),
                                            child: Padding(
                                              padding: EdgeInsets.all(24),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'New Arrival',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .plusJakartaSans(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .onSurface80,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                          lineHeight: 1.2,
                                                        ),
                                                  ),
                                                  Text(
                                                    'The Future\non Your Wrist',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .interTight(
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .onSurface,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmall
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model.buttonModel2,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: ButtonWidget(
                                                      content: 'Discover',
                                                      icon_present: false,
                                                      icon_end_present: false,
                                                      on_tap:
                                                          'navigate:AuthPortal',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .onPrimary,
                                                      variant: 'outline',
                                                      size: 'small',
                                                      full_width: false,
                                                      loading: false,
                                                      disabled: false,
                                                    ),
                                                  ),
                                                ].divide(SizedBox(height: 8)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 16)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 16)),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                      child: Container(
                        child: Text(
                          'Categories',
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                font: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontStyle,
                                lineHeight: 1.4,
                              ),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                            child: Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  wrapWithModel(
                                    model: _model.categoryChipModel1,
                                    updateCallback: () => safeSetState(() {}),
                                    child: CategoryChipWidget(
                                      icon: Icon(
                                        Icons.grid_view_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .onPrimary,
                                        size: 18,
                                      ),
                                      label: 'All',
                                      selected: true,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.categoryChipModel2,
                                    updateCallback: () => safeSetState(() {}),
                                    child: CategoryChipWidget(
                                      icon: Icon(
                                        Icons.devices_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 18,
                                      ),
                                      label: 'Tech',
                                      selected: false,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.categoryChipModel3,
                                    updateCallback: () => safeSetState(() {}),
                                    child: CategoryChipWidget(
                                      icon: Icon(
                                        Icons.checkroom_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 18,
                                      ),
                                      label: 'Fashion',
                                      selected: false,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.categoryChipModel4,
                                    updateCallback: () => safeSetState(() {}),
                                    child: CategoryChipWidget(
                                      icon: Icon(
                                        Icons.home_max_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 18,
                                      ),
                                      label: 'Home',
                                      selected: false,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.categoryChipModel5,
                                    updateCallback: () => safeSetState(() {}),
                                    child: CategoryChipWidget(
                                      icon: Icon(
                                        Icons.auto_awesome_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 18,
                                      ),
                                      label: 'Beauty',
                                      selected: false,
                                    ),
                                  ),
                                ].divide(SizedBox(width: 16)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ].divide(SizedBox(height: 16)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Popular Now',
                          style: FlutterFlowTheme.of(context)
                              .titleLarge
                              .override(
                                font: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .fontStyle,
                                lineHeight: 1.3,
                              ),
                        ),
                        Text(
                          'View More',
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                    lineHeight: 1.3,
                                  ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: wrapWithModel(
                                model: _model.productCardModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: ProductCardWidget(
                                  category: 'Audio',
                                  discount: true,
                                  discount_label: '-15%',
                                  img_desc:
                                      'https://dimg.dreamflow.cloud/v1/image/sony%20noise%20cancelling%20headphones',
                                  name: 'Sony WH-1000XM5',
                                  price: '\$349.00',
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: wrapWithModel(
                                model: _model.productCardModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: ProductCardWidget(
                                  category: 'Wearables',
                                  discount: false,
                                  discount_label: '-15%',
                                  img_desc:
                                      'https://dimg.dreamflow.cloud/v1/image/apple%20watch%20series%209%20midnight',
                                  name: 'Apple Watch S9',
                                  price: '\$399.00',
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 16)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: wrapWithModel(
                                model: _model.productCardModel3,
                                updateCallback: () => safeSetState(() {}),
                                child: ProductCardWidget(
                                  category: 'Laptops',
                                  discount: true,
                                  discount_label: 'NEW',
                                  img_desc:
                                      'https://dimg.dreamflow.cloud/v1/image/macbook%20air%20midnight%20blue',
                                  name: 'MacBook Air M3',
                                  price: '\$1,099.00',
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: wrapWithModel(
                                model: _model.productCardModel4,
                                updateCallback: () => safeSetState(() {}),
                                child: ProductCardWidget(
                                  category: 'Accessories',
                                  discount: false,
                                  discount_label: '-15%',
                                  img_desc:
                                      'https://dimg.dreamflow.cloud/v1/image/logitech%20mx%20master%203s%20mouse',
                                  name: 'Logitech MX Master',
                                  price: '\$99.00',
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 16)),
                        ),
                      ].divide(SizedBox(height: 16)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: wrapWithModel(
                                model: _model.productCardModel5,
                                updateCallback: () => safeSetState(() {}),
                                child: ProductCardWidget(
                                  category: 'Audio',
                                  discount: true,
                                  discount_label: '-15%',
                                  img_desc:
                                      'https://dimg.dreamflow.cloud/v1/image/sony%20noise%20cancelling%20headphones',
                                  name: 'Sony WH-1000XM5',
                                  price: '\$349.00',
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: wrapWithModel(
                                model: _model.productCardModel6,
                                updateCallback: () => safeSetState(() {}),
                                child: ProductCardWidget(
                                  category: 'Wearables',
                                  discount: false,
                                  discount_label: '-15%',
                                  img_desc:
                                      'https://dimg.dreamflow.cloud/v1/image/apple%20watch%20series%209%20midnight',
                                  name: 'Apple Watch S9',
                                  price: '\$399.00',
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 16)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: wrapWithModel(
                                model: _model.productCardModel7,
                                updateCallback: () => safeSetState(() {}),
                                child: ProductCardWidget(
                                  category: 'Laptops',
                                  discount: true,
                                  discount_label: 'NEW',
                                  img_desc:
                                      'https://dimg.dreamflow.cloud/v1/image/macbook%20air%20midnight%20blue',
                                  name: 'MacBook Air M3',
                                  price: '\$1,099.00',
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: wrapWithModel(
                                model: _model.productCardModel8,
                                updateCallback: () => safeSetState(() {}),
                                child: ProductCardWidget(
                                  category: 'Accessories',
                                  discount: false,
                                  discount_label: '-15%',
                                  img_desc:
                                      'https://dimg.dreamflow.cloud/v1/image/logitech%20mx%20master%203s%20mouse',
                                  name: 'Logitech MX Master',
                                  price: '\$99.00',
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 16)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: wrapWithModel(
                                model: _model.productCardModel9,
                                updateCallback: () => safeSetState(() {}),
                                child: ProductCardWidget(
                                  category: 'Laptops',
                                  discount: true,
                                  discount_label: 'NEW',
                                  img_desc:
                                      'https://dimg.dreamflow.cloud/v1/image/macbook%20air%20midnight%20blue',
                                  name: 'MacBook Air M3',
                                  price: '\$1,099.00',
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: wrapWithModel(
                                model: _model.productCardModel10,
                                updateCallback: () => safeSetState(() {}),
                                child: ProductCardWidget(
                                  category: 'Accessories',
                                  discount: false,
                                  discount_label: '-15%',
                                  img_desc:
                                      'https://dimg.dreamflow.cloud/v1/image/logitech%20mx%20master%203s%20mouse',
                                  name: 'Logitech MX Master',
                                  price: '\$99.00',
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 16)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: wrapWithModel(
                                model: _model.productCardModel11,
                                updateCallback: () => safeSetState(() {}),
                                child: ProductCardWidget(
                                  category: 'Laptops',
                                  discount: true,
                                  discount_label: 'NEW',
                                  img_desc:
                                      'https://dimg.dreamflow.cloud/v1/image/macbook%20air%20midnight%20blue',
                                  name: 'MacBook Air M3',
                                  price: '\$1,099.00',
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: wrapWithModel(
                                model: _model.productCardModel12,
                                updateCallback: () => safeSetState(() {}),
                                child: ProductCardWidget(
                                  category: 'Accessories',
                                  discount: false,
                                  discount_label: '-15%',
                                  img_desc:
                                      'https://dimg.dreamflow.cloud/v1/image/logitech%20mx%20master%203s%20mouse',
                                  name: 'Logitech MX Master',
                                  price: '\$99.00',
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 16)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: wrapWithModel(
                                model: _model.productCardModel13,
                                updateCallback: () => safeSetState(() {}),
                                child: ProductCardWidget(
                                  category: 'Laptops',
                                  discount: true,
                                  discount_label: 'NEW',
                                  img_desc:
                                      'https://dimg.dreamflow.cloud/v1/image/macbook%20air%20midnight%20blue',
                                  name: 'MacBook Air M3',
                                  price: '\$1,099.00',
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: wrapWithModel(
                                model: _model.productCardModel14,
                                updateCallback: () => safeSetState(() {}),
                                child: ProductCardWidget(
                                  category: 'Accessories',
                                  discount: false,
                                  discount_label: '-15%',
                                  img_desc:
                                      'https://dimg.dreamflow.cloud/v1/image/logitech%20mx%20master%203s%20mouse',
                                  name: 'Logitech MX Master',
                                  price: '\$99.00',
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 16)),
                        ),
                      ].divide(SizedBox(height: 16)),
                    ),
                  ].divide(SizedBox(height: 16)),
                ),
              ),
              Container(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
