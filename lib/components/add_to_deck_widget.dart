import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/new_deck_widget.dart';
import '/components/t_c_g_icon_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_to_deck_model.dart';
export 'add_to_deck_model.dart';

class AddToDeckWidget extends StatefulWidget {
  const AddToDeckWidget({
    super.key,
    this.cardToAdd,
    this.image,
    this.name,
    this.id,
    required this.imageL,
    required this.cardType,
  });

  final DocumentReference? cardToAdd;
  final String? image;
  final String? name;
  final String? id;
  final String? imageL;
  final String? cardType;

  @override
  State<AddToDeckWidget> createState() => _AddToDeckWidgetState();
}

class _AddToDeckWidgetState extends State<AddToDeckWidget> {
  late AddToDeckModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddToDeckModel());

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
        height: 600.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 15.0, 25.0, 15.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.close,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 40.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('ADD_TO_DECK_COMP_close_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_bottom_sheet');
                        Navigator.pop(context);
                      },
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              50.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Add To Deck',
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: wrapWithModel(
                            model: _model.tCGIconModel1,
                            updateCallback: () => safeSetState(() {}),
                            child: TCGIconWidget(
                              iconType: widget!.cardType!,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('ADD_TO_DECK_COMP_NEW_DECK_BTN_ON_TAP');
                    logFirebaseEvent('Button_bottom_sheet');
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: NewDeckWidget(),
                        );
                      },
                    ).then((value) => safeSetState(() {}));

                    logFirebaseEvent('Button_google_analytics_event');
                    logFirebaseEvent('newDeck');
                  },
                  text: 'NEW DECK',
                  icon: Icon(
                    Icons.add,
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).secondary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.of(context).primary,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w900,
                          useGoogleFonts:
                              GoogleFonts.asMap().containsKey('Roboto'),
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              StreamBuilder<List<DecksRecord>>(
                stream: queryDecksRecord(
                  queryBuilder: (decksRecord) => decksRecord
                      .where(
                        'user',
                        isEqualTo: currentUserReference,
                      )
                      .where(
                        'tcg',
                        isEqualTo: widget!.cardType,
                      )
                      .orderBy('last_edited', descending: true),
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
                  List<DecksRecord> columnDecksRecordList = snapshot.data!;

                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(columnDecksRecordList.length,
                          (columnIndex) {
                        final columnDecksRecord =
                            columnDecksRecordList[columnIndex];
                        return StreamBuilder<DecksRecord>(
                          stream: DecksRecord.getDocument(
                              columnDecksRecord.reference),
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

                            final deckItemDecksRecord = snapshot.data!;

                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 1.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xCCE0E0E0),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 20.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if ((deckItemDecksRecord
                                                    .cards.isNotEmpty) ==
                                                true)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: StreamBuilder<
                                                    Cardsv2Record>(
                                                  stream:
                                                      Cardsv2Record.getDocument(
                                                          deckItemDecksRecord
                                                              .cards
                                                              .firstOrNull!),
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

                                                    final stackCardsv2Record =
                                                        snapshot.data!;

                                                    return Container(
                                                      width: 80.0,
                                                      child: Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/back.png',
                                                                width: 65.0,
                                                                height: 90.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.5, 0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/back.png',
                                                                width: 65.0,
                                                                height: 90.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                stackCardsv2Record
                                                                    .image,
                                                                width: 65.0,
                                                                height: 90.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          if (deckItemDecksRecord
                                                              .faved)
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Stack(
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            0.9),
                                                                    child: Icon(
                                                                      Icons
                                                                          .circle,
                                                                      color: Color(
                                                                          0xFF986C01),
                                                                      size:
                                                                          32.0,
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            0.9),
                                                                    child: Icon(
                                                                      Icons
                                                                          .stars_rounded,
                                                                      color: Color(
                                                                          0xFFF9B205),
                                                                      size:
                                                                          32.0,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            if ((columnDecksRecord
                                                    .cards.isNotEmpty) ==
                                                false)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Container(
                                                  width: 80.0,
                                                  child: Stack(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/back.png',
                                                            width: 65.0,
                                                            height: 90.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -0.5, 0.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/back.png',
                                                            width: 65.0,
                                                            height: 90.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/back.png',
                                                            width: 65.0,
                                                            height: 90.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            Flexible(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  7.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                columnDecksRecord
                                                                    .name,
                                                                maxLines: 2,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineMediumFamily,
                                                                      fontSize:
                                                                          22.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).headlineMediumFamily),
                                                                    ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child:
                                                                        TCGIconWidget(
                                                                      key: Key(
                                                                          'Key2qz_${columnIndex}_of_${columnDecksRecordList.length}'),
                                                                      iconType:
                                                                          deckItemDecksRecord
                                                                              .tcg,
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          deckItemDecksRecord
                                                                              .description,
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 7.0)),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 7.0)),
                                                      ),
                                                    ),
                                                  ),
                                                  Stack(
                                                    children: [
                                                      if (!columnDecksRecord
                                                          .cardIDs
                                                          .contains(widget!.id))
                                                        Icon(
                                                          Icons.add,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 30.0,
                                                        ),
                                                      if (columnDecksRecord
                                                          .cardIDs
                                                          .contains(widget!.id))
                                                        Icon(
                                                          Icons.check,
                                                          color:
                                                              Color(0xFF2D832F),
                                                          size: 30.0,
                                                        ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ].addToStart(SizedBox(width: 16.0)),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: columnDecksRecord.cardIDs
                                                .contains(widget!.id)
                                            ? null
                                            : () async {
                                                logFirebaseEvent(
                                                    'ADD_TO_DECK_COMP__BTN_ON_TAP');
                                                final firestoreBatch =
                                                    FirebaseFirestore.instance
                                                        .batch();
                                                try {
                                                  if (!columnDecksRecord.cardIDs
                                                      .contains(widget!.id)) {
                                                    logFirebaseEvent(
                                                        'Button_backend_call');

                                                    var cardsv2RecordReference =
                                                        Cardsv2Record.collection
                                                            .doc();
                                                    firestoreBatch.set(
                                                        cardsv2RecordReference,
                                                        {
                                                          ...createCardsv2RecordData(
                                                            image:
                                                                widget!.image,
                                                            id: widget!.id,
                                                            name: widget!.name,
                                                            imageL:
                                                                widget!.imageL,
                                                            cardType: widget!
                                                                .cardType,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'date_added':
                                                                  FieldValue
                                                                      .serverTimestamp(),
                                                              'decks': [
                                                                columnDecksRecord
                                                                    .reference
                                                              ],
                                                            },
                                                          ),
                                                        });
                                                    _model.newCardInDeck =
                                                        Cardsv2Record
                                                            .getDocumentFromData({
                                                      ...createCardsv2RecordData(
                                                        image: widget!.image,
                                                        id: widget!.id,
                                                        name: widget!.name,
                                                        imageL: widget!.imageL,
                                                        cardType:
                                                            widget!.cardType,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'date_added':
                                                              DateTime.now(),
                                                          'decks': [
                                                            columnDecksRecord
                                                                .reference
                                                          ],
                                                        },
                                                      ),
                                                    }, cardsv2RecordReference);
                                                    logFirebaseEvent(
                                                        'Button_backend_call');

                                                    firestoreBatch.update(
                                                        columnDecksRecord
                                                            .reference,
                                                        {
                                                          ...mapToFirestore(
                                                            {
                                                              'cards': FieldValue
                                                                  .arrayUnion([
                                                                _model
                                                                    .newCardInDeck
                                                                    ?.reference
                                                              ]),
                                                              'cardIDs': FieldValue
                                                                  .arrayUnion([
                                                                widget!.id
                                                              ]),
                                                              'last_edited':
                                                                  FieldValue
                                                                      .serverTimestamp(),
                                                            },
                                                          ),
                                                        });
                                                    logFirebaseEvent(
                                                        'Button_google_analytics_event');
                                                    logFirebaseEvent(
                                                        'existingDeck');
                                                  }
                                                } finally {
                                                  await firestoreBatch.commit();
                                                }

                                                safeSetState(() {});
                                              },
                                        text:
                                            '                                            ',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: double.infinity,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconAlignment: IconAlignment.end,
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Colors.transparent,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 30.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        showLoadingIndicator: false,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 1.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xCCE0E0E0),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
