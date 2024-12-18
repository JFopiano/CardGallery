import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/card_enlarge_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profile/add_card_window/add_card_window_widget.dart';
import '/profile/card/card_widget.dart';
import '/profile/card_option_menu/card_option_menu_widget.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_cards_model.dart';
export 'user_cards_model.dart';

class UserCardsWidget extends StatefulWidget {
  const UserCardsWidget({
    super.key,
    required this.usersCardRef,
  });

  final DocumentReference? usersCardRef;

  @override
  State<UserCardsWidget> createState() => _UserCardsWidgetState();
}

class _UserCardsWidgetState extends State<UserCardsWidget> {
  late UserCardsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserCardsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'UserCards'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget!.usersCardRef!),
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

        final userCardsUsersRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: Visibility(
              visible: widget!.usersCardRef == currentUserReference,
              child: FloatingActionButton(
                onPressed: () async {
                  logFirebaseEvent('USER_CARDS_PAGE_AddCardBtn_ON_TAP');
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
                            addType: 'collection',
                            deckType: 'def',
                          ),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));

                  logFirebaseEvent('AddCardBtn_google_analytics_event');
                  logFirebaseEvent('cardAddUserCards');
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
                child: Container(
                  width: 400.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 15.0, 15.0, 0.0),
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
                                  Icons.arrow_back,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 40.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'USER_CARDS_PAGE_arrow_back_ICN_ON_TAP');
                                  logFirebaseEvent('IconButton_navigate_back');
                                  context.safePop();
                                },
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: Text(
                                  'Cards',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .headlineLargeFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .headlineLargeFamily),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 15.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 48.0,
                                      height: 48.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.network(
                                            userCardsUsersRecord.photoUrl,
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
                                    Flexible(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                '${userCardsUsersRecord.displayName}',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displayMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .displayMediumFamily,
                                                          fontSize: 28.0,
                                                          letterSpacing: 0.0,
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
                                        ],
                                      ),
                                    ),
                                  ],
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
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 15.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 0.0, 15.0, 0.0),
                                    child: StreamBuilder<List<Cardsv2Record>>(
                                      stream: queryCardsv2Record(
                                        queryBuilder: (cardsv2Record) =>
                                            cardsv2Record
                                                .where(
                                                  'user',
                                                  isEqualTo:
                                                      userCardsUsersRecord
                                                          .reference,
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
                                              child: CircularProgressIndicator(
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
                                          itemCount:
                                              cardGridCardsv2RecordList.length,
                                          itemBuilder:
                                              (context, cardGridIndex) {
                                            final cardGridCardsv2Record =
                                                cardGridCardsv2RecordList[
                                                    cardGridIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'USER_CARDS_PAGE_Stack_ketx6q5g_ON_TAP');
                                                logFirebaseEvent(
                                                    'Stack_bottom_sheet');
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Color(0xBC000000),
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            CardEnlargeViewWidget(
                                                          cardImage: cardGridCardsv2Record
                                                                          .imageL ==
                                                                      null ||
                                                                  cardGridCardsv2Record
                                                                          .imageL ==
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
                                                    safeSetState(() {}));
                                              },
                                              onLongPress: () async {
                                                logFirebaseEvent(
                                                    'USER_CARDS_Stack_ketx6q5g_ON_LONG_PRESS');
                                                if (cardGridCardsv2Record
                                                        .quantity <
                                                    1) {
                                                  logFirebaseEvent(
                                                      'Stack_backend_call');

                                                  await cardGridCardsv2Record
                                                      .reference
                                                      .update(
                                                          createCardsv2RecordData(
                                                    quantity: 1,
                                                  ));
                                                }
                                                logFirebaseEvent(
                                                    'Stack_bottom_sheet');
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            CardOptionMenuWidget(
                                                          cardRef:
                                                              cardGridCardsv2Record
                                                                  .reference,
                                                          inCollection: (currentUserDocument
                                                                      ?.cardIDs
                                                                      ?.toList() ??
                                                                  [])
                                                              .contains(
                                                                  cardGridCardsv2Record
                                                                      .id),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));

                                                logFirebaseEvent(
                                                    'Stack_google_analytics_event');
                                                logFirebaseEvent('editCards');
                                              },
                                              child: Stack(
                                                children: [
                                                  CardWidget(
                                                    key: Key(
                                                        'Key5qo_${cardGridIndex}_of_${cardGridCardsv2RecordList.length}'),
                                                    imgPath:
                                                        cardGridCardsv2Record
                                                            .image,
                                                    name: cardGridCardsv2Record
                                                        .name,
                                                    id: cardGridCardsv2Record
                                                        .id,
                                                  ),
                                                  if (cardGridCardsv2Record
                                                      .isFav)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Stack(
                                                        children: [
                                                          if (cardGridCardsv2Record
                                                              .isFav)
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -0.82,
                                                                      0.9),
                                                              child: Icon(
                                                                Icons.circle,
                                                                color: Color(
                                                                    0xFF986C01),
                                                                size: 32.0,
                                                              ),
                                                            ),
                                                          if (cardGridCardsv2Record
                                                              .isFav)
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -0.82,
                                                                      0.9),
                                                              child: Icon(
                                                                Icons
                                                                    .stars_rounded,
                                                                color: Color(
                                                                    0xFFF9B205),
                                                                size: 32.0,
                                                              ),
                                                            ),
                                                        ],
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
                                              ),
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
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 0.0, 0.0),
                          child: Text(
                            '${userCardsUsersRecord.cardIDs.length.toString()} cards',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ].addToEnd(SizedBox(height: 50.0)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
