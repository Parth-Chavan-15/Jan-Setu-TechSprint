import '/flutter_flow/flutter_flow_util.dart';
import 'buyer_home_widget.dart' show BuyerHomeWidget;
import 'package:flutter/material.dart';

class BuyerHomeModel extends FlutterFlowModel<BuyerHomeWidget> {
  ///  Local state fields for this page.

  String? tempImageURL;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadedPhoto = false;
  FFUploadedFile uploadedLocalFile_uploadedPhoto =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Gemini - Text From Image] action in Container widget.
  String? geminiResult;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
