import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_card_copy_copy_widget.dart' show AddCardCopyCopyWidget;
import 'package:flutter/material.dart';

class AddCardCopyCopyModel extends FlutterFlowModel<AddCardCopyCopyWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for CardName widget.
  FocusNode? cardNameFocusNode;
  TextEditingController? cardNameTextController;
  String? Function(BuildContext, String?)? cardNameTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    cardNameFocusNode?.dispose();
    cardNameTextController?.dispose();
  }
}
