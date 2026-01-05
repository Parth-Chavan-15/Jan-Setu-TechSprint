import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'seller_login_widget.dart' show SellerLoginWidget;
import 'package:flutter/material.dart';

class SellerLoginModel extends FlutterFlowModel<SellerLoginWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Email_TextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldTextController;
  String? Function(BuildContext, String?)?
      emailTextFieldTextControllerValidator;
  // State field(s) for Password_TextField widget.
  FocusNode? passwordTextFieldFocusNode;
  TextEditingController? passwordTextFieldTextController;
  late bool passwordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      passwordTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordTextFieldVisibility = false;
  }

  @override
  void dispose() {
    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();

    passwordTextFieldFocusNode?.dispose();
    passwordTextFieldTextController?.dispose();
  }
}
