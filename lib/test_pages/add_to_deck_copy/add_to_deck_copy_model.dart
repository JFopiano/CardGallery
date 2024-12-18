import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/new_deck_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'add_to_deck_copy_widget.dart' show AddToDeckCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddToDeckCopyModel extends FlutterFlowModel<AddToDeckCopyWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  Cardsv2Record? newCardInDeck;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
