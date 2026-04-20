import '/components/ProductRow.dart';
import '/components/StateCard.dart';
import '/components/TextField.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'inventory_management_model.dart';
export 'inventory_management_model.dart';

class InventoryManagementWidget extends StatefulWidget {
  const InventoryManagementWidget({super.key});

  static String routeName = 'InventoryManagement';
  static String routePath = '/inventoryManagement';

  @override
  State<InventoryManagementWidget> createState() =>
      _InventoryManagementWidgetState();
}

class _InventoryManagementWidgetState extends State<InventoryManagementWidget> {
  late InventoryManagementModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InventoryManagementModel());
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                shape: BoxShape.rectangle,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 16),
                    child: Container(
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
                                    'Inventory',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          font: GoogleFonts.plusJakartaSans(
                                            fontWeight: FontWeight.w800,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w800,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontStyle,
                                          lineHeight: 1.25,
                                        ),
                                  ),
                                  Text(
                                    'Manage your product catalog',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontStyle,
                                          lineHeight: 1.4,
                                        ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  borderRadius: BorderRadius.circular(9999),
                                  shape: BoxShape.rectangle,
                                ),
                                alignment: AlignmentDirectional(0, 0),
                                child: Icon(
                                  Icons.add_rounded,
                                  color: FlutterFlowTheme.of(context).onPrimary,
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                          wrapWithModel(
                            model: _model.textFieldModel,
                            updateCallback: () => safeSetState(() {}),
                            child: TextFieldWidget(
                              label: false,
                              helper: false,
                              hint: 'Search products...',
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
                        ].divide(SizedBox(height: 16)),
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
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: wrapWithModel(
                      model: _model.statCard2Model1,
                      updateCallback: () => safeSetState(() {}),
                      child: StatCard2Widget(
                        color: FlutterFlowTheme.of(context).primary,
                        icon: Icon(
                          Icons.inventory_2_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 18,
                        ),
                        label: 'Total Items',
                        value: '1,284',
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: wrapWithModel(
                      model: _model.statCard2Model2,
                      updateCallback: () => safeSetState(() {}),
                      child: StatCard2Widget(
                        color: FlutterFlowTheme.of(context).error,
                        icon: Icon(
                          Icons.warning_amber_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 18,
                        ),
                        label: 'Low Stock',
                        value: '12',
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 16)),
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
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                    child: Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 34,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1,
                              ),
                            ),
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.check_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 16,
                                  ),
                                  Text(
                                    'All Products',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.plusJakartaSans(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                          lineHeight: 1.3,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 6)),
                              ),
                            ),
                          ),
                          Container(
                            height: 34,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1,
                              ),
                            ),
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Clothing',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.plusJakartaSans(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                          lineHeight: 1.3,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 6)),
                              ),
                            ),
                          ),
                          Container(
                            height: 34,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1,
                              ),
                            ),
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Electronics',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.plusJakartaSans(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                          lineHeight: 1.3,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 6)),
                              ),
                            ),
                          ),
                          Container(
                            height: 34,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1,
                              ),
                            ),
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Home',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.plusJakartaSans(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                          lineHeight: 1.3,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 6)),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 8)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 80),
                        child: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              wrapWithModel(
                                model: _model.productRowModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: ProductRowWidget(
                                  img_desc:
                                      'https://dimg.dreamflow.cloud/v1/image/folded%20white%20t-shirt',
                                  name: 'Premium Cotton Tee',
                                  price: '\$29.00',
                                  status: 'Active',
                                  status_bg:
                                      FlutterFlowTheme.of(context).success15,
                                  status_color:
                                      FlutterFlowTheme.of(context).success,
                                  stock: '45',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.productRowModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: ProductRowWidget(
                                  img_desc:
                                      'https://dimg.dreamflow.cloud/v1/image/sleek%20black%20headphones',
                                  name: 'Wireless Noise Cancelling Headphones',
                                  price: '\$249.00',
                                  status: 'Low Stock',
                                  status_bg:
                                      FlutterFlowTheme.of(context).error15,
                                  status_color:
                                      FlutterFlowTheme.of(context).error,
                                  stock: '8',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.productRowModel3,
                                updateCallback: () => safeSetState(() {}),
                                child: ProductRowWidget(
                                  img_desc:
                                      'https://dimg.dreamflow.cloud/v1/image/brown%20leather%20wallet',
                                  name: 'Minimalist Leather Wallet',
                                  price: '\$45.00',
                                  status: 'Active',
                                  status_bg:
                                      FlutterFlowTheme.of(context).success15,
                                  status_color:
                                      FlutterFlowTheme.of(context).success,
                                  stock: '120',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.productRowModel4,
                                updateCallback: () => safeSetState(() {}),
                                child: ProductRowWidget(
                                  img_desc:
                                      'https://dimg.dreamflow.cloud/v1/image/modern%20smartwatch',
                                  name: 'Smart Fitness Watch',
                                  price: '\$199.00',
                                  status: 'Out of Stock',
                                  status_bg:
                                      FlutterFlowTheme.of(context).alternate,
                                  status_color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  stock: '0',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.productRowModel5,
                                updateCallback: () => safeSetState(() {}),
                                child: ProductRowWidget(
                                  img_desc:
                                      'https://dimg.dreamflow.cloud/v1/image/matte%20grey%20mug',
                                  name: 'Ceramic Coffee Mug',
                                  price: '\$18.00',
                                  status: 'Active',
                                  status_bg:
                                      FlutterFlowTheme.of(context).success15,
                                  status_color:
                                      FlutterFlowTheme.of(context).success,
                                  stock: '62',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.productRowModel6,
                                updateCallback: () => safeSetState(() {}),
                                child: ProductRowWidget(
                                  img_desc:
                                      'https://dimg.dreamflow.cloud/v1/image/slim%20power%20bank',
                                  name: 'Portable Power Bank',
                                  price: '\$59.00',
                                  status: 'Active',
                                  status_bg:
                                      FlutterFlowTheme.of(context).success15,
                                  status_color:
                                      FlutterFlowTheme.of(context).success,
                                  stock: '15',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.productRowModel7,
                                updateCallback: () => safeSetState(() {}),
                                child: ProductRowWidget(
                                  img_desc:
                                      'https://dimg.dreamflow.cloud/v1/image/small%20cylinder%20speaker',
                                  name: 'Bluetooth Speaker',
                                  price: '\$89.00',
                                  status: 'Low Stock',
                                  status_bg:
                                      FlutterFlowTheme.of(context).error15,
                                  status_color:
                                      FlutterFlowTheme.of(context).error,
                                  stock: '3',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.productRowModel8,
                                updateCallback: () => safeSetState(() {}),
                                child: ProductRowWidget(
                                  img_desc:
                                      'https://dimg.dreamflow.cloud/v1/image/rolled%20purple%20yoga%20mat',
                                  name: 'Yoga Mat Pro',
                                  price: '\$55.00',
                                  status: 'Active',
                                  status_bg:
                                      FlutterFlowTheme.of(context).success15,
                                  status_color:
                                      FlutterFlowTheme.of(context).success,
                                  stock: '28',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Stack(
              alignment: AlignmentDirectional(1, 1),
              children: [
                Padding(
                  padding: EdgeInsets.all(24),
                  child: Container(
                    child: Container(
                      width: 140,
                      height: 50,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.circular(9999),
                        shape: BoxShape.rectangle,
                      ),
                      alignment: AlignmentDirectional(0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.post_add_rounded,
                            color: FlutterFlowTheme.of(context).onPrimary,
                            size: 20,
                          ),
                          Text(
                            'New Product',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).onPrimary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                  lineHeight: 1.5,
                                ),
                          ),
                        ].divide(SizedBox(width: 8)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
