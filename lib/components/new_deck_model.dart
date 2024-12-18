import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/t_c_g_icon_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'new_deck_widget.dart' show NewDeckWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewDeckModel extends FlutterFlowModel<NewDeckWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for TCGIcon component.
  late TCGIconModel tCGIconModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for deckName widget.
  FocusNode? deckNameFocusNode;
  TextEditingController? deckNameTextController;
  String? Function(BuildContext, String?)? deckNameTextControllerValidator;
  // State field(s) for deckDesc widget.
  FocusNode? deckDescFocusNode;
  TextEditingController? deckDescTextController;
  String? Function(BuildContext, String?)? deckDescTextControllerValidator;

  @override
  void initState(BuildContext context) {
    tCGIconModel = createModel(context, () => TCGIconModel());
  }

  @override
  void dispose() {
    tCGIconModel.dispose();
    deckNameFocusNode?.dispose();
    deckNameTextController?.dispose();

    deckDescFocusNode?.dispose();
    deckDescTextController?.dispose();
  }
}
