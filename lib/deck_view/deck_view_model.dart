import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/card_enlarge_view_widget.dart';
import '/components/edit_deck_widget.dart';
import '/components/t_c_g_icon_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profile/add_card_window/add_card_window_widget.dart';
import '/profile/card/card_widget.dart';
import '/profile/card_in_list_option_menu/card_in_list_option_menu_widget.dart';
import 'dart:ui';
import 'deck_view_widget.dart' show DeckViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeckViewModel extends FlutterFlowModel<DeckViewWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> cardlist2 = [];
  void addToCardlist2(DocumentReference item) => cardlist2.add(item);
  void removeFromCardlist2(DocumentReference item) => cardlist2.remove(item);
  void removeAtIndexFromCardlist2(int index) => cardlist2.removeAt(index);
  void insertAtIndexInCardlist2(int index, DocumentReference item) =>
      cardlist2.insert(index, item);
  void updateCardlist2AtIndex(
          int index, Function(DocumentReference) updateFn) =>
      cardlist2[index] = updateFn(cardlist2[index]);

  bool debug = false;

  ///  State fields for stateful widgets in this page.

  DecksRecord? deckViewPreviousSnapshot;
  // Model for TCGIcon component.
  late TCGIconModel tCGIconModel;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  Cardsv2Record? newCardInList;

  @override
  void initState(BuildContext context) {
    tCGIconModel = createModel(context, () => TCGIconModel());
  }

  @override
  void dispose() {
    tCGIconModel.dispose();
  }
}
