import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/new_deck_widget.dart';
import '/components/t_c_g_icon_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'add_to_deck_widget.dart' show AddToDeckWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddToDeckModel extends FlutterFlowModel<AddToDeckWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for TCGIcon component.
  late TCGIconModel tCGIconModel1;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  Cardsv2Record? newCardInDeck;

  @override
  void initState(BuildContext context) {
    tCGIconModel1 = createModel(context, () => TCGIconModel());
  }

  @override
  void dispose() {
    tCGIconModel1.dispose();
  }
}
