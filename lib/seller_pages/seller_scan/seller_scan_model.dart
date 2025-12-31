import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'seller_scan_widget.dart' show SellerScanWidget;
import 'package:flutter/material.dart';

class SellerScanModel extends FlutterFlowModel<SellerScanWidget> {
  ///  Local state fields for this page.

  List<dynamic> scannedResults = [];
  void addToScannedResults(dynamic item) => scannedResults.add(item);
  void removeFromScannedResults(dynamic item) => scannedResults.remove(item);
  void removeAtIndexFromScannedResults(int index) =>
      scannedResults.removeAt(index);
  void insertAtIndexInScannedResults(int index, dynamic item) =>
      scannedResults.insert(index, item);
  void updateScannedResultsAtIndex(int index, Function(dynamic) updateFn) =>
      scannedResults[index] = updateFn(scannedResults[index]);

  String voiceTranscript = ' ';

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadedFile = false;
  FFUploadedFile uploadedLocalFile_uploadedFile =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - convertImageToBase64] action in Container widget.
  String? base64String;
  // Stores action output result for [Backend Call - API (AnalyzeInvoice)] action in Container widget.
  ApiCallResponse? apiResult;
  bool isDataUploading_uploadedPDF = false;
  FFUploadedFile uploadedLocalFile_uploadedPDF =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - convertImageToBase64] action in Container widget.
  String? pdfBase64;
  // Stores action output result for [Backend Call - API (AnalyzeInvoice)] action in Container widget.
  ApiCallResponse? apiResultPDF;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
