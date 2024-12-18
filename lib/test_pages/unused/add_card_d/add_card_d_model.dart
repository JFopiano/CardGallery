import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/profile/card/card_widget.dart';
import 'dart:ui';
import 'add_card_d_widget.dart' show AddCardDWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddCardDModel extends FlutterFlowModel<AddCardDWidget> {
  ///  Local state fields for this component.

  dynamic apiResponse;

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for CardName widget.
  FocusNode? cardNameFocusNode;
  TextEditingController? cardNameTextController;
  String? Function(BuildContext, String?)? cardNameTextControllerValidator;
  // Stores action output result for [Backend Call - API (getPokemon)] action in Button widget.
  ApiCallResponse? apiResultc25;
  // Model for card component.
  late CardModel cardModel;

  @override
  void initState(BuildContext context) {
    cardModel = createModel(context, () => CardModel());
  }

  @override
  void dispose() {
    cardNameFocusNode?.dispose();
    cardNameTextController?.dispose();

    cardModel.dispose();
  }
}
