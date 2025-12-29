import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'barcode_scanner_widget.dart' show BarcodeScannerWidget;
import 'package:flutter/material.dart';

class BarcodeScannerModel extends FlutterFlowModel<BarcodeScannerWidget> {
  ///  State fields for stateful widgets in this page.

  var scannedValue = '';
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MedicinesRecord? foundMedicine;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  StoreInventoryRecord? existingStock;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
