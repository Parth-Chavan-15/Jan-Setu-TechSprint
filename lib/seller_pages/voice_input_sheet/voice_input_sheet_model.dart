import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'voice_input_sheet_widget.dart' show VoiceInputSheetWidget;
import 'package:flutter/material.dart';

class VoiceInputSheetModel extends FlutterFlowModel<VoiceInputSheetWidget> {
  ///  Local state fields for this component.

  List<dynamic> voiceList = [];
  void addToVoiceList(dynamic item) => voiceList.add(item);
  void removeFromVoiceList(dynamic item) => voiceList.remove(item);
  void removeAtIndexFromVoiceList(int index) => voiceList.removeAt(index);
  void insertAtIndexInVoiceList(int index, dynamic item) =>
      voiceList.insert(index, item);
  void updateVoiceListAtIndex(int index, Function(dynamic) updateFn) =>
      voiceList[index] = updateFn(voiceList[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for voiceInputContext widget.
  FocusNode? voiceInputContextFocusNode;
  TextEditingController? voiceInputContextTextController;
  String? Function(BuildContext, String?)?
      voiceInputContextTextControllerValidator;
  // Stores action output result for [Backend Call - API (AnalyzeText)] action in voiceInputContext widget.
  ApiCallResponse? apiResultVoice;
  // Stores action output result for [Backend Call - API (AnalyzeText)] action in IconButton widget.
  ApiCallResponse? apiResultVoiceCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    voiceInputContextFocusNode?.dispose();
    voiceInputContextTextController?.dispose();
  }
}
