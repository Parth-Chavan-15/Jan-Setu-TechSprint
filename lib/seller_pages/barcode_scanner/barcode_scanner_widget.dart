import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'barcode_scanner_model.dart';
export 'barcode_scanner_model.dart';

class BarcodeScannerWidget extends StatefulWidget {
  const BarcodeScannerWidget({super.key});

  static String routeName = 'Barcode_Scanner';
  static String routePath = '/barcodeScanner';

  @override
  State<BarcodeScannerWidget> createState() => _BarcodeScannerWidgetState();
}

class _BarcodeScannerWidgetState extends State<BarcodeScannerWidget> {
  late BarcodeScannerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BarcodeScannerModel());
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
        backgroundColor: Colors.black,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.0, -1.0),
                child: FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 40.0,
                  fillColor: Colors.black,
                  icon: Icon(
                    Icons.arrow_back,
                    color: FlutterFlowTheme.of(context).info,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: 280.0,
                      height: 280.0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(24.0),
                        border: Border.all(
                          color: Colors.white,
                          width: 4.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Text(
                  'Align code within frame',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: Color(0xFFCCCCCC),
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    _model.scannedValue =
                        await FlutterBarcodeScanner.scanBarcode(
                      '#C62828', // scanning line color
                      'Cancel', // cancel button text
                      true, // whether to show the flash icon
                      ScanMode.BARCODE,
                    );

                    _model.foundMedicine = await queryMedicinesRecordOnce(
                      queryBuilder: (medicinesRecord) => medicinesRecord.where(
                        'barcode',
                        isEqualTo: 'scannedValue',
                      ),
                      singleRecord: true,
                    ).then((s) => s.firstOrNull);
                    if (_model.foundMedicine != null) {
                      _model.sellerStore = await queryStoresRecordOnce(
                        queryBuilder: (storesRecord) => storesRecord.where(
                          'owner_uid',
                          isEqualTo: currentUserUid,
                        ),
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);
                      if (_model.sellerStore != null) {
                        _model.existingStock =
                            await queryStoreInventoryRecordOnce(
                          queryBuilder: (storeInventoryRecord) =>
                              storeInventoryRecord
                                  .where(
                                    'medicine_id',
                                    isEqualTo: _model.foundMedicine?.reference,
                                  )
                                  .where(
                                    'store_ref',
                                    isEqualTo: _model.sellerStore?.reference,
                                  ),
                          singleRecord: true,
                        ).then((s) => s.firstOrNull);
                        if (_model.existingStock != null) {
                          await _model.existingStock!.reference.update({
                            ...createStoreInventoryRecordData(
                              status: 'Verified',
                              isGeneric: _model.foundMedicine?.isGeneric,
                            ),
                            ...mapToFirestore(
                              {
                                'qty_in_stock': FieldValue.increment(1),
                                'last_updated': FieldValue.serverTimestamp(),
                              },
                            ),
                          });
                        } else {
                          await StoreInventoryRecord.collection.doc().set({
                            ...createStoreInventoryRecordData(
                              qtyInStock: 1,
                              medicineId: _model.foundMedicine?.reference,
                              status: 'Verified',
                              unitPrice: valueOrDefault<double>(
                                _model.foundMedicine?.stdPrice,
                                0.0,
                              ),
                              storeRef: _model.sellerStore?.reference,
                              isGeneric: _model.foundMedicine?.isGeneric,
                            ),
                            ...mapToFirestore(
                              {
                                'last_updated': FieldValue.serverTimestamp(),
                              },
                            ),
                          });
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Added ${_model.foundMedicine?.brandName} (+1)',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            duration: Duration(milliseconds: 2000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).primary,
                          ),
                        );
                      } else {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Access Denied'),
                              content:
                                  Text('No store assigned to this account.'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    } else {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Unknown Item'),
                            content: Text(
                                'This product is not in the Global Database. (Link feature coming soon).'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                    }

                    safeSetState(() {});
                  },
                  text: 'Tap to Scan',
                  icon: Icon(
                    Icons.qr_code_scanner,
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    width: 220.0,
                    height: 50.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.interTight(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: Colors.white,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
