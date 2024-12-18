import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'preferences_widget.dart' show PreferencesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PreferencesModel extends FlutterFlowModel<PreferencesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for pokemon_slider widget.
  bool? pokemonSliderValue;
  // State field(s) for magic_slider widget.
  bool? magicSliderValue;
  // State field(s) for onepiece_slider widget.
  bool? onepieceSliderValue;
  // State field(s) for dragonball_slider widget.
  bool? dragonballSliderValue;
  // State field(s) for digimon_slider widget.
  bool? digimonSliderValue;
  // State field(s) for union_slider widget.
  bool? unionSliderValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
