import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/t_c_g_icon_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'edit_deck_widget.dart' show EditDeckWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditDeckModel extends FlutterFlowModel<EditDeckWidget> {
  ///  Local state fields for this component.

  int? loopCtr = 0;

  ///  State fields for stateful widgets in this component.

  // Model for TCGIcon component.
  late TCGIconModel tCGIconModel;
  // State field(s) for deckName widget.
  FocusNode? deckNameFocusNode;
  TextEditingController? deckNameTextController;
  String? Function(BuildContext, String?)? deckNameTextControllerValidator;
  // State field(s) for deckDesc widget.
  FocusNode? deckDescFocusNode;
  TextEditingController? deckDescTextController;
  String? Function(BuildContext, String?)? deckDescTextControllerValidator;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  Cardsv2Record? firstCard;

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
