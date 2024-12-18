import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_to_deck_widget.dart';
import '/components/card_enlarge_view_widget.dart';
import '/components/t_c_g_icon_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'card_in_list_option_menu_widget.dart' show CardInListOptionMenuWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CardInListOptionMenuModel
    extends FlutterFlowModel<CardInListOptionMenuWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for TCGIcon component.
  late TCGIconModel tCGIconModel;
  // State field(s) for cardQty widget.
  FocusNode? cardQtyFocusNode;
  TextEditingController? cardQtyTextController;
  String? Function(BuildContext, String?)? cardQtyTextControllerValidator;

  @override
  void initState(BuildContext context) {
    tCGIconModel = createModel(context, () => TCGIconModel());
  }

  @override
  void dispose() {
    tCGIconModel.dispose();
    cardQtyFocusNode?.dispose();
    cardQtyTextController?.dispose();
  }
}
