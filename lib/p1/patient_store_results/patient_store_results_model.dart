import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'patient_store_results_widget.dart' show PatientStoreResultsWidget;
import 'package:flutter/material.dart';

class PatientStoreResultsModel
    extends FlutterFlowModel<PatientStoreResultsWidget> {
  ///  Local state fields for this page.

  List<StoreInventoryRecord> sortedInventory = [];
  void addToSortedInventory(StoreInventoryRecord item) =>
      sortedInventory.add(item);
  void removeFromSortedInventory(StoreInventoryRecord item) =>
      sortedInventory.remove(item);
  void removeAtIndexFromSortedInventory(int index) =>
      sortedInventory.removeAt(index);
  void insertAtIndexInSortedInventory(int index, StoreInventoryRecord item) =>
      sortedInventory.insert(index, item);
  void updateSortedInventoryAtIndex(
          int index, Function(StoreInventoryRecord) updateFn) =>
      sortedInventory[index] = updateFn(sortedInventory[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Patient_Store_Results widget.
  List<StoreInventoryRecord>? inputListxyz;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
