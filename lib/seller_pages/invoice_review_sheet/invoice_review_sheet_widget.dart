import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'invoice_review_sheet_model.dart';
export 'invoice_review_sheet_model.dart';

class InvoiceReviewSheetWidget extends StatefulWidget {
  const InvoiceReviewSheetWidget({
    super.key,
    required this.itemsList,
  });

  final List<dynamic>? itemsList;

  @override
  State<InvoiceReviewSheetWidget> createState() =>
      _InvoiceReviewSheetWidgetState();
}

class _InvoiceReviewSheetWidgetState extends State<InvoiceReviewSheetWidget> {
  late InvoiceReviewSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InvoiceReviewSheetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.editableList = widget.itemsList!.toList().cast<dynamic>();
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 6.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 25.0, 16.0, 25.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Text(
                      'Review Scanned Invoice',
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontStyle,
                              ),
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: Color(0xC157636C),
                    icon: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Cancel Inventory Update?'),
                                content: Text(
                                    'Are you sure you want to exit? All items identified via voice or scan will be discarded from this session.'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: Text('No, Keep Reviewing'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: Text('Yes, Discard All'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                      if (confirmDialogResponse) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 25.0),
                child: Builder(
                  builder: (context) {
                    final invoiceItem = widget.itemsList!.toList();

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: invoiceItem.length,
                      itemBuilder: (context, invoiceItemIndex) {
                        final invoiceItemItem = invoiceItem[invoiceItemIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Container(
                              width: 100.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: Color(0xFF808080),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      getJsonField(
                                        invoiceItemItem,
                                        r'''$.name''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          getJsonField(
                                            invoiceItemItem,
                                            r'''$.qty''',
                                          ).toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      fillColor: Color(0xFFFF0000),
                                      icon: Icon(
                                        Icons.delete,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 20.0,
                                      ),
                                      onPressed: () async {
                                        _model.removeAtIndexFromEditableList(
                                            invoiceItemIndex);
                                        safeSetState(() {});
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Item removed.',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 1000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
              child: FFButtonWidget(
                onPressed: () async {
                  _model.skippedNames = '';
                  safeSetState(() {});
                  _model.sellerStore = await queryStoresRecordOnce(
                    queryBuilder: (storesRecord) => storesRecord.where(
                      'owner_uid',
                      isEqualTo: currentUserUid,
                    ),
                    singleRecord: true,
                  ).then((s) => s.firstOrNull);
                  if (_model.sellerStore != null) {
                    for (int loop1Index = 0;
                        loop1Index < _model.editableList.length;
                        loop1Index++) {
                      final currentLoop1Item = _model.editableList[loop1Index];
                      _model.matchedMedicine = await queryMedicinesRecordOnce(
                        queryBuilder: (medicinesRecord) =>
                            medicinesRecord.where(
                          'brand_name',
                          isEqualTo: getJsonField(
                            currentLoop1Item,
                            r'''$.name''',
                          ).toString(),
                        ),
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);
                      if (_model.matchedMedicine != null) {
                        _model.inventoryEntry =
                            await queryStoreInventoryRecordOnce(
                          queryBuilder: (storeInventoryRecord) =>
                              storeInventoryRecord
                                  .where(
                                    'medicine_id',
                                    isEqualTo:
                                        _model.matchedMedicine?.reference,
                                  )
                                  .where(
                                    'store_ref',
                                    isEqualTo: _model.sellerStore?.reference,
                                  ),
                          singleRecord: true,
                        ).then((s) => s.firstOrNull);
                        if (_model.inventoryEntry != null) {
                          await _model.inventoryEntry!.reference.update({
                            ...createStoreInventoryRecordData(
                              status: 'Verified',
                              isGeneric: _model.matchedMedicine?.isGeneric,
                            ),
                            ...mapToFirestore(
                              {
                                'qty_in_stock':
                                    FieldValue.increment(getJsonField(
                                  currentLoop1Item,
                                  r'''$.qty''',
                                )),
                                'last_updated': FieldValue.serverTimestamp(),
                              },
                            ),
                          });
                        } else {
                          await StoreInventoryRecord.collection.doc().set({
                            ...createStoreInventoryRecordData(
                              qtyInStock: getJsonField(
                                currentLoop1Item,
                                r'''$.qty''',
                              ),
                              medicineId: _model.matchedMedicine?.reference,
                              status: 'Verified',
                              unitPrice: valueOrDefault<double>(
                                _model.matchedMedicine?.stdPrice,
                                0.0,
                              ),
                              storeRef: _model.sellerStore?.reference,
                              isGeneric: _model.matchedMedicine?.isGeneric,
                            ),
                            ...mapToFirestore(
                              {
                                'last_updated': FieldValue.serverTimestamp(),
                              },
                            ),
                          });
                        }
                      } else {
                        _model.skippedNames =
                            '${_model.skippedNames}, ${getJsonField(
                          currentLoop1Item,
                          r'''$.name''',
                        ).toString()}';
                        safeSetState(() {});
                      }
                    }
                    if (_model.skippedNames != null &&
                        _model.skippedNames != '') {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Update Complete with Warnings'),
                            content: Text(
                                'Stock updated. The following items were skipped (Not in Global Catalog): ${_model.skippedNames}'),
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
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Success! All items verified and stock updated.',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 2000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                    }
                  } else {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Access Denied'),
                          content: Text('No store assigned to this account.'),
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
                text: 'Confirm & Add Stock',
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  height: 50.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFF0E3F30),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.interTight(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: Colors.white,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
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
    );
  }
}
