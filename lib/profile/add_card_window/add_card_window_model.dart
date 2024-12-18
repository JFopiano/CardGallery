import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/add_to_deck_widget.dart';
import '/components/card_enlarge_view_widget.dart';
import '/components/t_c_g_icon_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/profile/card/card_widget.dart';
import 'dart:ui';
import 'add_card_window_widget.dart' show AddCardWindowWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddCardWindowModel extends FlutterFlowModel<AddCardWindowWidget> {
  ///  Local state fields for this component.

  dynamic apiResponse;

  bool searched = false;

  bool debug = false;

  bool emptyDropDown = false;

  ///  State fields for stateful widgets in this component.

  // Model for TCGIcon component.
  late TCGIconModel tCGIconModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for CardName widget.
  FocusNode? cardNameFocusNode;
  TextEditingController? cardNameTextController;
  String? Function(BuildContext, String?)? cardNameTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  Cardsv2Record? newCardInDeck;

  @override
  void initState(BuildContext context) {
    tCGIconModel = createModel(context, () => TCGIconModel());
  }

  @override
  void dispose() {
    tCGIconModel.dispose();
    cardNameFocusNode?.dispose();
    cardNameTextController?.dispose();
  }
}
