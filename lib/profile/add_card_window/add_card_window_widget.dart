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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_card_window_model.dart';
export 'add_card_window_model.dart';

class AddCardWindowWidget extends StatefulWidget {
  const AddCardWindowWidget({
    super.key,
    String? addType,
    this.currentDeck,
    this.deckType,
  }) : this.addType = addType ?? 'collection';

  final String addType;
  final DocumentReference? currentDeck;
  final String? deckType;

  @override
  State<AddCardWindowWidget> createState() => _AddCardWindowWidgetState();
}

class _AddCardWindowWidgetState extends State<AddCardWindowWidget> {
  late AddCardWindowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddCardWindowModel());

    _model.cardNameTextController ??= TextEditingController();
    _model.cardNameFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: 400.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
          border: Border.all(
            color: FlutterFlowTheme.of(context).primaryText,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 50.0,
                      icon: Icon(
                        Icons.close,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'ADD_CARD_WINDOW_COMP_CloseBtn_ON_TAP');
                        logFirebaseEvent('CloseBtn_bottom_sheet');
                        Navigator.pop(context);
                        logFirebaseEvent('CloseBtn_google_analytics_event');
                        logFirebaseEvent('closeCardSearch');
                      },
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 8.0, 0.0),
                          child: wrapWithModel(
                            model: _model.tCGIconModel,
                            updateCallback: () => safeSetState(() {}),
                            child: TCGIconWidget(
                              iconType: () {
                                if (widget!.addType == 'deck') {
                                  return widget!.deckType!;
                                } else if (_model.dropDownValue != null &&
                                    _model.dropDownValue != '') {
                                  return _model.dropDownValue!;
                                } else {
                                  return 'def';
                                }
                              }(),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            'New Card',
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineLargeFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineLargeFamily),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                if (widget!.addType == 'collection')
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController ??=
                              FormFieldController<String>(
                            _model.dropDownValue ??= '',
                          ),
                          options: List<String>.from([
                            'pokemon',
                            'magic',
                            'one-piece',
                            'dragon-ball-fusion',
                            'digimon',
                            'union-arena'
                          ]),
                          optionLabels: [
                            'Pokémon',
                            'Magic: The Gathering',
                            'One Piece',
                            'Dragon Ball Fusion',
                            'Digimon',
                            'Union Arena'
                          ],
                          onChanged: (val) async {
                            safeSetState(() => _model.dropDownValue = val);
                            logFirebaseEvent(
                                'ADD_CARD_WINDOW_DropDown_ol7490ib_ON_FOR');
                            logFirebaseEvent('DropDown_update_component_state');
                            _model.emptyDropDown = false;
                          },
                          height: 40.0,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                          hintText: 'Select TCG...',
                          icon: Icon(
                            Icons.arrow_drop_down_outlined,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: Colors.black,
                          borderWidth: 2.0,
                          borderRadius: 0.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ],
                    ),
                  ),
                Container(
                  width: double.infinity,
                  child: TextFormField(
                    controller: _model.cardNameTextController,
                    focusNode: _model.cardNameFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.cardNameTextController',
                      Duration(milliseconds: 2000),
                      () => safeSetState(() {}),
                    ),
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Roboto',
                                letterSpacing: 0.0,
                                useGoogleFonts:
                                    GoogleFonts.asMap().containsKey('Roboto'),
                              ),
                      hintText: 'Card Name . . . ',
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Roboto',
                                letterSpacing: 0.0,
                                useGoogleFonts:
                                    GoogleFonts.asMap().containsKey('Roboto'),
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Roboto',
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              GoogleFonts.asMap().containsKey('Roboto'),
                        ),
                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                    validator: _model.cardNameTextControllerValidator
                        .asValidator(context),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: widget!.addType == 'deck' ? 515.0 : 475.0,
                      decoration: BoxDecoration(),
                      child: Visibility(
                        visible: ((_model.dropDownValue != null &&
                                    _model.dropDownValue != '') ||
                                (widget!.deckType != null &&
                                    widget!.deckType != '')) &&
                            (_model.cardNameTextController.text != null &&
                                _model.cardNameTextController.text != ''),
                        child: FutureBuilder<ApiCallResponse>(
                          future: GetPokemonCall.call(
                            cardName:
                                _model.cardNameTextController.text == null ||
                                        _model.cardNameTextController.text == ''
                                    ? ''
                                    : _model.cardNameTextController.text,
                            cardType: widget!.addType == 'collection'
                                ? _model.dropDownValue
                                : widget!.deckType,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            final listViewGetPokemonResponse = snapshot.data!;

                            return Builder(
                              builder: (context) {
                                final cardData = getJsonField(
                                  listViewGetPokemonResponse.jsonBody,
                                  r'''$.data''',
                                ).toList();

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: cardData.length,
                                  itemBuilder: (context, cardDataIndex) {
                                    final cardDataItem =
                                        cardData[cardDataIndex];
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'ADD_CARD_WINDOW_Container_96zxg3qg_ON_TA');
                                              logFirebaseEvent(
                                                  'card_bottom_sheet');
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Color(0xBC000000),
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        CardEnlargeViewWidget(
                                                      cardImage: getJsonField(
                                                        cardDataItem,
                                                        r'''$.images.large''',
                                                      ).toString(),
                                                      cardName: getJsonField(
                                                        cardDataItem,
                                                        r'''$.name''',
                                                      ).toString(),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                            child: CardWidget(
                                              key: Key(
                                                  'Key96z_${cardDataIndex}_of_${cardData.length}'),
                                              imgPath: getJsonField(
                                                cardDataItem,
                                                r'''$.images.small''',
                                              ).toString(),
                                              name: getJsonField(
                                                _model.apiResponse,
                                                r'''$.name''',
                                              ).toString(),
                                              id: getJsonField(
                                                _model.apiResponse,
                                                r'''$.id''',
                                              ).toString(),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (widget!.addType == 'deck')
                                                StreamBuilder<DecksRecord>(
                                                  stream:
                                                      DecksRecord.getDocument(
                                                          widget!.currentDeck!),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }

                                                    final columnDecksRecord =
                                                        snapshot.data!;

                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      7.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: FFButtonWidget(
                                                            onPressed: (columnDecksRecord
                                                                        .cardIDs
                                                                        .contains(
                                                                            getJsonField(
                                                                      cardDataItem,
                                                                      r'''$.id''',
                                                                    ).toString()) ==
                                                                    true)
                                                                ? null
                                                                : () async {
                                                                    logFirebaseEvent(
                                                                        'ADD_CARD_WINDOW_ADD_TO_THIS_DECK_BTN_ON_');
                                                                    final firestoreBatch =
                                                                        FirebaseFirestore
                                                                            .instance
                                                                            .batch();
                                                                    try {
                                                                      if (!columnDecksRecord
                                                                          .cardIDs
                                                                          .contains(
                                                                              getJsonField(
                                                                        cardDataItem,
                                                                        r'''$.id''',
                                                                      ).toString())) {
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');

                                                                        var cardsv2RecordReference = Cardsv2Record
                                                                            .collection
                                                                            .doc();
                                                                        firestoreBatch.set(
                                                                            cardsv2RecordReference,
                                                                            {
                                                                              ...createCardsv2RecordData(
                                                                                image: getJsonField(
                                                                                  cardDataItem,
                                                                                  r'''$.images.small''',
                                                                                ).toString(),
                                                                                id: getJsonField(
                                                                                  cardDataItem,
                                                                                  r'''$.id''',
                                                                                ).toString(),
                                                                                name: getJsonField(
                                                                                  cardDataItem,
                                                                                  r'''$.name''',
                                                                                ).toString(),
                                                                                imageL: getJsonField(
                                                                                  cardDataItem,
                                                                                  r'''$.images.large''',
                                                                                ).toString(),
                                                                                cardType: widget!.deckType != null && widget!.deckType != '' ? widget!.deckType : _model.dropDownValue,
                                                                              ),
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'date_added': FieldValue.serverTimestamp(),
                                                                                  'decks': [
                                                                                    widget!.currentDeck
                                                                                  ],
                                                                                },
                                                                              ),
                                                                            });
                                                                        _model.newCardInDeck =
                                                                            Cardsv2Record.getDocumentFromData({
                                                                          ...createCardsv2RecordData(
                                                                            image:
                                                                                getJsonField(
                                                                              cardDataItem,
                                                                              r'''$.images.small''',
                                                                            ).toString(),
                                                                            id: getJsonField(
                                                                              cardDataItem,
                                                                              r'''$.id''',
                                                                            ).toString(),
                                                                            name:
                                                                                getJsonField(
                                                                              cardDataItem,
                                                                              r'''$.name''',
                                                                            ).toString(),
                                                                            imageL:
                                                                                getJsonField(
                                                                              cardDataItem,
                                                                              r'''$.images.large''',
                                                                            ).toString(),
                                                                            cardType: widget!.deckType != null && widget!.deckType != ''
                                                                                ? widget!.deckType
                                                                                : _model.dropDownValue,
                                                                          ),
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'date_added': DateTime.now(),
                                                                              'decks': [
                                                                                widget!.currentDeck
                                                                              ],
                                                                            },
                                                                          ),
                                                                        }, cardsv2RecordReference);
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');

                                                                        firestoreBatch.update(
                                                                            columnDecksRecord.reference,
                                                                            {
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'cards': FieldValue.arrayUnion([
                                                                                    _model.newCardInDeck?.reference
                                                                                  ]),
                                                                                  'cardIDs': FieldValue.arrayUnion([
                                                                                    _model.newCardInDeck?.id
                                                                                  ]),
                                                                                  'last_edited': FieldValue.serverTimestamp(),
                                                                                },
                                                                              ),
                                                                            });
                                                                        logFirebaseEvent(
                                                                            'Button_google_analytics_event');
                                                                        logFirebaseEvent(
                                                                            'addToThisDeck');
                                                                      }
                                                                    } finally {
                                                                      await firestoreBatch
                                                                          .commit();
                                                                    }

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text:
                                                                'ADD TO THIS DECK',
                                                            icon: Icon(
                                                              Icons
                                                                  .add_to_photos,
                                                              size: 15.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 220.0,
                                                              height: 60.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              textStyle:
                                                                  GoogleFonts
                                                                      .getFont(
                                                                'Roboto',
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900,
                                                              ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              disabledColor:
                                                                  Color(
                                                                      0xFFBCBCBC),
                                                              disabledTextColor:
                                                                  Color(
                                                                      0xFF6D7A83),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      7.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'ADD_CARD_WINDOW_ADD_TO_DECK_BTN_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Button_bottom_sheet');
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                enableDrag:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        AddToDeckWidget(
                                                                      image:
                                                                          getJsonField(
                                                                        cardDataItem,
                                                                        r'''$.images.small''',
                                                                      ).toString(),
                                                                      name:
                                                                          getJsonField(
                                                                        cardDataItem,
                                                                        r'''$.name''',
                                                                      ).toString(),
                                                                      id: getJsonField(
                                                                        cardDataItem,
                                                                        r'''$.id''',
                                                                      ).toString(),
                                                                      imageL:
                                                                          getJsonField(
                                                                        cardDataItem,
                                                                        r'''$.images.large''',
                                                                      ).toString(),
                                                                      cardType: widget!.deckType != null &&
                                                                              widget!.deckType !=
                                                                                  ''
                                                                          ? widget!
                                                                              .deckType!
                                                                          : _model
                                                                              .dropDownValue!,
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));
                                                            },
                                                            text: 'ADD TO DECK',
                                                            icon: Icon(
                                                              Icons.add,
                                                              size: 15.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 220.0,
                                                              height: 40.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              textStyle:
                                                                  GoogleFonts
                                                                      .getFont(
                                                                'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900,
                                                              ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      7.0,
                                                                      0.0,
                                                                      0.0),
                                                          child:
                                                              AuthUserStreamWidget(
                                                            builder: (context) =>
                                                                FFButtonWidget(
                                                              onPressed: (currentUserDocument
                                                                              ?.cardIDs
                                                                              ?.toList() ??
                                                                          [])
                                                                      .contains(
                                                                          getJsonField(
                                                                cardDataItem,
                                                                r'''$.id''',
                                                              ).toString())
                                                                  ? null
                                                                  : () async {
                                                                      logFirebaseEvent(
                                                                          'ADD_CARD_WINDOW_ADD_TO_COLLECTION_BTN_ON');
                                                                      final firestoreBatch = FirebaseFirestore
                                                                          .instance
                                                                          .batch();
                                                                      try {
                                                                        if ((currentUserDocument?.cardIDs?.toList() ?? []).contains(getJsonField(
                                                                              cardDataItem,
                                                                              r'''$.id''',
                                                                            ).toString()) !=
                                                                            true) {
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');

                                                                          firestoreBatch.set(
                                                                              Cardsv2Record.collection.doc(),
                                                                              {
                                                                                ...createCardsv2RecordData(
                                                                                  user: currentUserReference,
                                                                                  image: getJsonField(
                                                                                    cardDataItem,
                                                                                    r'''$.images.small''',
                                                                                  ).toString(),
                                                                                  id: getJsonField(
                                                                                    cardDataItem,
                                                                                    r'''$.id''',
                                                                                  ).toString(),
                                                                                  name: getJsonField(
                                                                                    cardDataItem,
                                                                                    r'''$.name''',
                                                                                  ).toString(),
                                                                                  imageL: getJsonField(
                                                                                    cardDataItem,
                                                                                    r'''$.images.large''',
                                                                                  ).toString(),
                                                                                  cardType: widget!.deckType != null && widget!.deckType != '' ? widget!.deckType : _model.dropDownValue,
                                                                                ),
                                                                                ...mapToFirestore(
                                                                                  {
                                                                                    'date_added': FieldValue.serverTimestamp(),
                                                                                  },
                                                                                ),
                                                                              });
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');

                                                                          firestoreBatch.update(
                                                                              currentUserReference!,
                                                                              {
                                                                                ...mapToFirestore(
                                                                                  {
                                                                                    'cardIDs': FieldValue.arrayUnion([
                                                                                      getJsonField(
                                                                                        cardDataItem,
                                                                                        r'''$.id''',
                                                                                      ).toString()
                                                                                    ]),
                                                                                  },
                                                                                ),
                                                                              });
                                                                          logFirebaseEvent(
                                                                              'Button_google_analytics_event');
                                                                          logFirebaseEvent(
                                                                              'addToCollection');
                                                                        }
                                                                      } finally {
                                                                        await firestoreBatch
                                                                            .commit();
                                                                      }
                                                                    },
                                                              text:
                                                                  'ADD TO COLLECTION',
                                                              icon: Icon(
                                                                Icons.add,
                                                                size: 15.0,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 220.0,
                                                                height: 40.0,
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                textStyle:
                                                                    GoogleFonts
                                                                        .getFont(
                                                                  'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w900,
                                                                ),
                                                                elevation: 0.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: (currentUserDocument?.cardIDs?.toList() ??
                                                                              [])
                                                                          .contains(
                                                                              getJsonField(
                                                                    cardDataItem,
                                                                    r'''$.id''',
                                                                  ).toString())
                                                                      ? Color(
                                                                          0x00000000)
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                disabledColor:
                                                                    Color(
                                                                        0xFFBCBCBC),
                                                                disabledTextColor:
                                                                    Color(
                                                                        0xFF6D7A83),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                              if (widget!.addType ==
                                                  'collection')
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  7.0,
                                                                  0.0,
                                                                  0.0),
                                                      child:
                                                          AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            FFButtonWidget(
                                                          onPressed: (currentUserDocument
                                                                          ?.cardIDs
                                                                          ?.toList() ??
                                                                      [])
                                                                  .contains(
                                                                      getJsonField(
                                                            cardDataItem,
                                                            r'''$.id''',
                                                          ).toString())
                                                              ? null
                                                              : () async {
                                                                  logFirebaseEvent(
                                                                      'ADD_CARD_WINDOW_ADD_TO_COLLECTION_BTN_ON');
                                                                  final firestoreBatch =
                                                                      FirebaseFirestore
                                                                          .instance
                                                                          .batch();
                                                                  try {
                                                                    logFirebaseEvent(
                                                                        'Button_backend_call');

                                                                    firestoreBatch.set(
                                                                        Cardsv2Record
                                                                            .collection
                                                                            .doc(),
                                                                        {
                                                                          ...createCardsv2RecordData(
                                                                            user:
                                                                                currentUserReference,
                                                                            image:
                                                                                getJsonField(
                                                                              cardDataItem,
                                                                              r'''$.images.small''',
                                                                            ).toString(),
                                                                            id: getJsonField(
                                                                              cardDataItem,
                                                                              r'''$.id''',
                                                                            ).toString(),
                                                                            name:
                                                                                getJsonField(
                                                                              cardDataItem,
                                                                              r'''$.name''',
                                                                            ).toString(),
                                                                            cardType:
                                                                                _model.dropDownValue,
                                                                            imageL:
                                                                                getJsonField(
                                                                              cardDataItem,
                                                                              r'''$.images.large''',
                                                                            ).toString(),
                                                                          ),
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'date_added': FieldValue.serverTimestamp(),
                                                                            },
                                                                          ),
                                                                        });
                                                                    logFirebaseEvent(
                                                                        'Button_backend_call');

                                                                    firestoreBatch
                                                                        .update(
                                                                            currentUserReference!,
                                                                            {
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'cardIDs': FieldValue.arrayUnion([
                                                                                getJsonField(
                                                                                  cardDataItem,
                                                                                  r'''$.id''',
                                                                                ).toString()
                                                                              ]),
                                                                            },
                                                                          ),
                                                                        });
                                                                  } finally {
                                                                    await firestoreBatch
                                                                        .commit();
                                                                  }
                                                                },
                                                          text:
                                                              'ADD TO COLLECTION',
                                                          icon: Icon(
                                                            Icons.add_to_photos,
                                                            size: 15.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 220.0,
                                                            height: 60.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            textStyle:
                                                                GoogleFonts
                                                                    .getFont(
                                                              'Roboto',
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                            ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            disabledColor:
                                                                Color(
                                                                    0xFFBCBCBC),
                                                            disabledTextColor:
                                                                Color(
                                                                    0xFF6D7A83),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  7.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'ADD_CARD_WINDOW_ADD_TO_DECK_BTN_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Button_bottom_sheet');
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    AddToDeckWidget(
                                                                  image:
                                                                      getJsonField(
                                                                    cardDataItem,
                                                                    r'''$.images.small''',
                                                                  ).toString(),
                                                                  name:
                                                                      getJsonField(
                                                                    cardDataItem,
                                                                    r'''$.name''',
                                                                  ).toString(),
                                                                  id: getJsonField(
                                                                    cardDataItem,
                                                                    r'''$.id''',
                                                                  ).toString(),
                                                                  imageL:
                                                                      getJsonField(
                                                                    cardDataItem,
                                                                    r'''$.images.large''',
                                                                  ).toString(),
                                                                  cardType: _model
                                                                      .dropDownValue!,
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));

                                                          logFirebaseEvent(
                                                              'Button_google_analytics_event');
                                                          logFirebaseEvent(
                                                              'addDeck');
                                                        },
                                                        text: 'ADD TO DECK',
                                                        icon: Icon(
                                                          Icons.add,
                                                          size: 15.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width: 220.0,
                                                          height: 40.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          textStyle: GoogleFonts
                                                              .getFont(
                                                            'Roboto',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                          ),
                                                          elevation: 0.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ].divide(SizedBox(height: 14.0)),
            ),
          ),
        ),
      ),
    );
  }
}
