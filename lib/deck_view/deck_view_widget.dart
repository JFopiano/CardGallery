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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'deck_view_model.dart';
export 'deck_view_model.dart';

class DeckViewWidget extends StatefulWidget {
  const DeckViewWidget({
    super.key,
    required this.userDeckRef,
    required this.deckRef,
    required this.cardList,
  });

  final DocumentReference? userDeckRef;
  final DocumentReference? deckRef;
  final List<DocumentReference>? cardList;

  @override
  State<DeckViewWidget> createState() => _DeckViewWidgetState();
}

class _DeckViewWidgetState extends State<DeckViewWidget> {
  late DeckViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeckViewModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'DeckView'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('DECK_VIEW_PAGE_DeckView_ON_INIT_STATE');
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DecksRecord>(
      stream: DecksRecord.getDocument(widget!.deckRef!)
        ..listen((deckViewDecksRecord) async {
          if (_model.deckViewPreviousSnapshot != null &&
              !DecksRecordDocumentEquality().equals(
                  deckViewDecksRecord, _model.deckViewPreviousSnapshot)) {
            logFirebaseEvent('DECK_VIEW_PAGE_DeckView_ON_DATA_CHANGE');

            safeSetState(() {});
          }
          _model.deckViewPreviousSnapshot = deckViewDecksRecord;
        }),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }

        final deckViewDecksRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: Visibility(
              visible: widget!.userDeckRef == currentUserReference,
              child: FloatingActionButton(
                onPressed: () async {
                  logFirebaseEvent('DECK_VIEW_PAGE_AddCardBtn_ON_TAP');
                  logFirebaseEvent('AddCardBtn_bottom_sheet');
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        child: Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: AddCardWindowWidget(
                            addType: 'deck',
                            currentDeck: widget!.deckRef,
                            deckType: deckViewDecksRecord.tcg,
                          ),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));

                  logFirebaseEvent('AddCardBtn_google_analytics_event');
                  logFirebaseEvent('addCardDeckView');
                },
                backgroundColor: FlutterFlowTheme.of(context).primary,
                elevation: 8.0,
                child: Icon(
                  Icons.add_rounded,
                  color: FlutterFlowTheme.of(context).info,
                  size: 24.0,
                ),
              ),
            ),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: StreamBuilder<UsersRecord>(
                  stream: UsersRecord.getDocument(widget!.userDeckRef!),
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

                    final containerUsersRecord = snapshot.data!;

                    return Container(
                      width: 400.0,
                      decoration: BoxDecoration(),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 15.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 60.0,
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 40.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'DECK_VIEW_PAGE_arrow_back_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_navigate_back');
                                      context.safePop();
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 15.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'DECK_VIEW_PAGE_Container_n05lnm04_ON_TAP');
                                          if (widget!.userDeckRef?.id ==
                                              currentUserReference?.id) {
                                            logFirebaseEvent(
                                                'Container_navigate_to');

                                            context.pushNamed(
                                              'ProfileBio',
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType
                                                          .leftToRight,
                                                ),
                                              },
                                            );
                                          } else {
                                            logFirebaseEvent(
                                                'Container_navigate_to');

                                            context.pushNamed(
                                              'ProfileBioSEARCHED',
                                              queryParameters: {
                                                'otherUserPage': serializeParam(
                                                  widget!.userDeckRef,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          }
                                        },
                                        child: Container(
                                          width: 48.0,
                                          height: 48.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.network(
                                                containerUsersRecord.photoUrl,
                                              ).image,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                              color: Color(0xCCE0E0E0),
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'DECK_VIEW_PAGE_UsernameTHIS_ON_TAP');
                                                    if (widget!
                                                            .userDeckRef?.id ==
                                                        currentUserReference
                                                            ?.id) {
                                                      logFirebaseEvent(
                                                          'UsernameTHIS_navigate_to');

                                                      context.pushNamed(
                                                        'ProfileBio',
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .leftToRight,
                                                          ),
                                                        },
                                                      );
                                                    } else {
                                                      logFirebaseEvent(
                                                          'UsernameTHIS_navigate_to');

                                                      context.pushNamed(
                                                        'ProfileBioSEARCHED',
                                                        queryParameters: {
                                                          'otherUserPage':
                                                              serializeParam(
                                                            widget!.userDeckRef,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    }
                                                  },
                                                  child: Text(
                                                    '${containerUsersRecord.displayName}',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .displayMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .displayMediumFamily,
                                                          fontSize: 28.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .displayMediumFamily),
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 15.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Text(
                                                  deckViewDecksRecord.name,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .displaySmallFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .displaySmallFamily),
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            wrapWithModel(
                                              model: _model.tCGIconModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: TCGIconWidget(
                                                iconType:
                                                    deckViewDecksRecord.tcg,
                                              ),
                                            ),
                                            if (deckViewDecksRecord.faved &&
                                                (widget!.userDeckRef ==
                                                    currentUserReference))
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Icon(
                                                        Icons.circle,
                                                        color:
                                                            Color(0xFF986C01),
                                                        size: 35.0,
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.stars_rounded,
                                                      color: Color(0xFFF9B205),
                                                      size: 35.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (deckViewDecksRecord.description != null &&
                                      deckViewDecksRecord.description != '')
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: SelectionArea(
                                            child: Text(
                                          deckViewDecksRecord.description,
                                          textAlign: TextAlign.start,
                                          maxLines: 10,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLargeFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLargeFamily),
                                              ),
                                        )),
                                      ),
                                    ),
                                  if (widget!.userDeckRef ==
                                      currentUserReference)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'DECK_VIEW_PAGE_EDIT_DECK_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_bottom_sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: EditDeckWidget(
                                                    deckBeingEdited:
                                                        widget!.deckRef!,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));

                                          logFirebaseEvent(
                                              'Button_google_analytics_event');
                                          logFirebaseEvent('edditDeck');
                                        },
                                        text: 'EDIT DECK',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w900,
                                                useGoogleFonts:
                                                    GoogleFonts.asMap()
                                                        .containsKey('Roboto'),
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  if (_model.debug)
                                    FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'DECK_VIEW_ADD_CARD_TO_DECK_BTN_ON_TAP');
                                        logFirebaseEvent('Button_backend_call');

                                        var cardsv2RecordReference =
                                            Cardsv2Record.collection.doc();
                                        await cardsv2RecordReference.set({
                                          ...createCardsv2RecordData(
                                            image:
                                                'https://images.pokemontcg.io/base1/32.png',
                                            id: '0001',
                                            name: 'TEST',
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'decks': [widget!.deckRef],
                                              'date_added':
                                                  FieldValue.serverTimestamp(),
                                            },
                                          ),
                                        });
                                        _model.newCardInList =
                                            Cardsv2Record.getDocumentFromData({
                                          ...createCardsv2RecordData(
                                            image:
                                                'https://images.pokemontcg.io/base1/32.png',
                                            id: '0001',
                                            name: 'TEST',
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'decks': [widget!.deckRef],
                                              'date_added': DateTime.now(),
                                            },
                                          ),
                                        }, cardsv2RecordReference);
                                        logFirebaseEvent('Button_backend_call');

                                        await widget!.deckRef!.update({
                                          ...mapToFirestore(
                                            {
                                              'cards': FieldValue.arrayUnion([
                                                _model.newCardInList?.reference
                                              ]),
                                            },
                                          ),
                                        });
                                        logFirebaseEvent(
                                            'Button_update_page_state');
                                        _model.addToCardlist2(
                                            _model.newCardInList!.reference);
                                        safeSetState(() {});

                                        safeSetState(() {});
                                      },
                                      text: 'add card to deck',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color: Colors.white,
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
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                ].addToStart(SizedBox(height: 10.0)),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: StreamBuilder<List<Cardsv2Record>>(
                                        stream: queryCardsv2Record(
                                          queryBuilder: (cardsv2Record) =>
                                              cardsv2Record
                                                  .where(
                                                    'decks',
                                                    arrayContains:
                                                        widget!.deckRef,
                                                  )
                                                  .orderBy('date_added'),
                                        ),
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
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<Cardsv2Record>
                                              cardGridCardsv2RecordList =
                                              snapshot.data!;

                                          return GridView.builder(
                                            padding: EdgeInsets.zero,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              crossAxisSpacing: 10.0,
                                              mainAxisSpacing: 10.0,
                                              childAspectRatio: 0.75,
                                            ),
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: cardGridCardsv2RecordList
                                                .length,
                                            itemBuilder:
                                                (context, cardGridIndex) {
                                              final cardGridCardsv2Record =
                                                  cardGridCardsv2RecordList[
                                                      cardGridIndex];
                                              return Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'DECK_VIEW_PAGE_Container_afpukaql_ON_TAP');
                                                        logFirebaseEvent(
                                                            'card_bottom_sheet');
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Color(0xBC000000),
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    CardEnlargeViewWidget(
                                                                  cardImage: cardGridCardsv2Record.imageL ==
                                                                              null ||
                                                                          cardGridCardsv2Record.imageL ==
                                                                              ''
                                                                      ? cardGridCardsv2Record
                                                                          .image
                                                                      : cardGridCardsv2Record
                                                                          .imageL,
                                                                  cardName:
                                                                      cardGridCardsv2Record
                                                                          .name,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                      onLongPress: () async {
                                                        logFirebaseEvent(
                                                            'DECK_VIEW_Container_afpukaql_ON_LONG_PRE');
                                                        if (cardGridCardsv2Record
                                                                .quantity <
                                                            1) {
                                                          logFirebaseEvent(
                                                              'card_backend_call');

                                                          await cardGridCardsv2Record
                                                              .reference
                                                              .update(
                                                                  createCardsv2RecordData(
                                                            quantity: 1,
                                                          ));
                                                        }
                                                        logFirebaseEvent(
                                                            'card_bottom_sheet');
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    CardInListOptionMenuWidget(
                                                                  cardRef:
                                                                      cardGridCardsv2Record
                                                                          .reference,
                                                                  deckRef:
                                                                      deckViewDecksRecord
                                                                          .reference,
                                                                  inCollection: (currentUserDocument
                                                                              ?.cardIDs
                                                                              ?.toList() ??
                                                                          [])
                                                                      .contains(
                                                                          cardGridCardsv2Record
                                                                              .id),
                                                                  updateState:
                                                                      (cardToDelete) async {
                                                                    logFirebaseEvent(
                                                                        '_update_page_state');
                                                                    _model.removeFromCardlist2(
                                                                        cardToDelete);
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                      child: CardWidget(
                                                        key: Key(
                                                            'Keyafp_${cardGridIndex}_of_${cardGridCardsv2RecordList.length}'),
                                                        imgPath:
                                                            cardGridCardsv2Record
                                                                .image,
                                                        name:
                                                            cardGridCardsv2Record
                                                                .name,
                                                        id: cardGridCardsv2Record
                                                            .id,
                                                      ),
                                                    ),
                                                  ),
                                                  if ((cardGridCardsv2Record
                                                              .quantity !=
                                                          null) &&
                                                      (cardGridCardsv2Record
                                                              .quantity >
                                                          1))
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.99, 0.99),
                                                      child: Container(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xDC000000),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    8.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    8.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0.0),
                                                          ),
                                                          shape: BoxShape
                                                              .rectangle,
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            'x${valueOrDefault<String>(
                                                              cardGridCardsv2Record
                                                                  .quantity
                                                                  .toString(),
                                                              '1',
                                                            )}'
                                                                .maybeHandleOverflow(
                                                              maxChars: 4,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineSmallFamily),
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Text(
                                '${deckViewDecksRecord.cardIDs.length.toString()} card${deckViewDecksRecord.cardIDs.length == 1 ? '' : 's'}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ].addToEnd(SizedBox(height: 50.0)),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
