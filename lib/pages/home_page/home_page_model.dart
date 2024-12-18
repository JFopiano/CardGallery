import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/card_enlarge_view_widget.dart';
import '/components/home_no_result_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profile/card_option_menu/card_option_menu_widget.dart';
import 'dart:ui';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for homeNoResult component.
  late HomeNoResultModel homeNoResultModel;

  @override
  void initState(BuildContext context) {
    homeNoResultModel = createModel(context, () => HomeNoResultModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    homeNoResultModel.dispose();
  }
}
