import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'patient_search_widget.dart' show PatientSearchWidget;
import 'package:flutter/material.dart';

class PatientSearchModel extends FlutterFlowModel<PatientSearchWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> myMedicineList = [];
  void addToMyMedicineList(DocumentReference item) => myMedicineList.add(item);
  void removeFromMyMedicineList(DocumentReference item) =>
      myMedicineList.remove(item);
  void removeAtIndexFromMyMedicineList(int index) =>
      myMedicineList.removeAt(index);
  void insertAtIndexInMyMedicineList(int index, DocumentReference item) =>
      myMedicineList.insert(index, item);
  void updateMyMedicineListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      myMedicineList[index] = updateFn(myMedicineList[index]);

  String? searchField;

  ///  State fields for stateful widgets in this page.

  // State field(s) for SearchInput widget.
  FocusNode? searchInputFocusNode;
  TextEditingController? searchInputTextController;
  String? Function(BuildContext, String?)? searchInputTextControllerValidator;
  bool isDataUploading_uploadedRxCopy = false;
  FFUploadedFile uploadedLocalFile_uploadedRxCopy =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - convertImageToBase64] action in IconButton widget.
  String? base64StringCopy;
  // Stores action output result for [Backend Call - API (AnalyzePrescription)] action in IconButton widget.
  ApiCallResponse? aiResponseCopy;
  // Stores action output result for [Custom Action - convertNamesToRefs] action in IconButton widget.
  List<DocumentReference>? foundMedicineRefsCopy;
  bool isDataUploading_uploadedRx = false;
  FFUploadedFile uploadedLocalFile_uploadedRx =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - convertImageToBase64] action in Button widget.
  String? base64String;
  // Stores action output result for [Backend Call - API (AnalyzePrescription)] action in Button widget.
  ApiCallResponse? aiResponse;
  // Stores action output result for [Custom Action - convertNamesToRefs] action in Button widget.
  List<DocumentReference>? foundMedicineRefs;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchInputFocusNode?.dispose();
    searchInputTextController?.dispose();
  }
}
