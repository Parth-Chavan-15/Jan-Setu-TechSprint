import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'shop_registration_widget.dart' show ShopRegistrationWidget;
import 'package:flutter/material.dart';

class ShopRegistrationModel extends FlutterFlowModel<ShopRegistrationWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for storeNameField widget.
  FocusNode? storeNameFieldFocusNode;
  TextEditingController? storeNameFieldTextController;
  String? Function(BuildContext, String?)?
      storeNameFieldTextControllerValidator;
  String? _storeNameFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Store Name is required';
    }

    return null;
  }

  // State field(s) for licenseField widget.
  FocusNode? licenseFieldFocusNode;
  TextEditingController? licenseFieldTextController;
  String? Function(BuildContext, String?)? licenseFieldTextControllerValidator;
  String? _licenseFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Drug License Number is required';
    }

    return null;
  }

  // State field(s) for storeAddressField widget.
  FocusNode? storeAddressFieldFocusNode;
  TextEditingController? storeAddressFieldTextController;
  String? Function(BuildContext, String?)?
      storeAddressFieldTextControllerValidator;
  String? _storeAddressFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Store Address is required';
    }

    return null;
  }

  // State field(s) for latField widget.
  FocusNode? latFieldFocusNode;
  TextEditingController? latFieldTextController;
  String? Function(BuildContext, String?)? latFieldTextControllerValidator;
  String? _latFieldTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Lat is required';
    }

    return null;
  }

  // State field(s) for lngField widget.
  FocusNode? lngFieldFocusNode;
  TextEditingController? lngFieldTextController;
  String? Function(BuildContext, String?)? lngFieldTextControllerValidator;
  String? _lngFieldTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Lng is required';
    }

    return null;
  }

  // State field(s) for storePhoneField widget.
  FocusNode? storePhoneFieldFocusNode;
  TextEditingController? storePhoneFieldTextController;
  String? Function(BuildContext, String?)?
      storePhoneFieldTextControllerValidator;
  String? _storePhoneFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Contact Number is required';
    }

    return null;
  }

  // State field(s) for isGenericSwitch widget.
  bool? isGenericSwitchValue;

  @override
  void initState(BuildContext context) {
    storeNameFieldTextControllerValidator =
        _storeNameFieldTextControllerValidator;
    licenseFieldTextControllerValidator = _licenseFieldTextControllerValidator;
    storeAddressFieldTextControllerValidator =
        _storeAddressFieldTextControllerValidator;
    latFieldTextControllerValidator = _latFieldTextControllerValidator;
    lngFieldTextControllerValidator = _lngFieldTextControllerValidator;
    storePhoneFieldTextControllerValidator =
        _storePhoneFieldTextControllerValidator;
  }

  @override
  void dispose() {
    storeNameFieldFocusNode?.dispose();
    storeNameFieldTextController?.dispose();

    licenseFieldFocusNode?.dispose();
    licenseFieldTextController?.dispose();

    storeAddressFieldFocusNode?.dispose();
    storeAddressFieldTextController?.dispose();

    latFieldFocusNode?.dispose();
    latFieldTextController?.dispose();

    lngFieldFocusNode?.dispose();
    lngFieldTextController?.dispose();

    storePhoneFieldFocusNode?.dispose();
    storePhoneFieldTextController?.dispose();
  }
}
