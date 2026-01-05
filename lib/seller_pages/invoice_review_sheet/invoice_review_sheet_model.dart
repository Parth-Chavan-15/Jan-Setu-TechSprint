import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'invoice_review_sheet_widget.dart' show InvoiceReviewSheetWidget;
import 'package:flutter/material.dart';

class InvoiceReviewSheetModel
    extends FlutterFlowModel<InvoiceReviewSheetWidget> {
  ///  Local state fields for this component.

  List<dynamic> editableList = [];
  void addToEditableList(dynamic item) => editableList.add(item);
  void removeFromEditableList(dynamic item) => editableList.remove(item);
  void removeAtIndexFromEditableList(int index) => editableList.removeAt(index);
  void insertAtIndexInEditableList(int index, dynamic item) =>
      editableList.insert(index, item);
  void updateEditableListAtIndex(int index, Function(dynamic) updateFn) =>
      editableList[index] = updateFn(editableList[index]);

  String? skippedNames = '';

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  StoresRecord? sellerStore;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MedicinesRecord? matchedMedicine;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  StoreInventoryRecord? inventoryEntry;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
