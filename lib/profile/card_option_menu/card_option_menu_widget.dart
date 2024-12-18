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
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_option_menu_model.dart';
export 'card_option_menu_model.dart';

class CardOptionMenuWidget extends StatefulWidget {
  const CardOptionMenuWidget({
    super.key,
    required this.cardRef,
    required this.inCollection,
  });

  final DocumentReference? cardRef;
  final bool? inCollection;

  @override
  State<CardOptionMenuWidget> createState() => _CardOptionMenuWidgetState();
}

class _CardOptionMenuWidgetState extends State<CardOptionMenuWidget> {
  late CardOptionMenuModel _model;

  bool cardQtyFocusListenerRegistered = false;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardOptionMenuModel());

    _model.cardQtyFocusNode ??= FocusNode();

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
      child: StreamBuilder<Cardsv2Record>(
        stream: Cardsv2Record.getDocument(widget!.cardRef!),
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

          final containerCardsv2Record = snapshot.data!;

          return ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
            child: Container(
              width: 400.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  width: 1.0,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'CARD_OPTION_MENU_Container_sh9kko36_ON_T');
                            logFirebaseEvent('Container_bottom_sheet');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Color(0xBC000000),
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: CardEnlargeViewWidget(
                                    cardImage: containerCardsv2Record.image,
                                    cardName: containerCardsv2Record.name,
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                          child: Container(
                            height: 65.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            containerCardsv2Record.image,
                                            width: 40.0,
                                            height: 54.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Flexible(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Flexible(
                                                child: AutoSizeText(
                                                  containerCardsv2Record.name,
                                                  maxLines: 4,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 7.0)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 8.0, 0.0),
                                  child: Icon(
                                    Icons.fullscreen,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 36.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (containerCardsv2Record.user == currentUserReference)
                          Container(
                            height: 65.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Stack(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.tCGIconModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: TCGIconWidget(
                                          iconType:
                                              containerCardsv2Record.cardType,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).primary,
                                      disabledColor: Color(0xCCE0E0E0),
                                      icon: Icon(
                                        Icons.remove,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                      onPressed: (/* NOT RECOMMENDED */ _model
                                                  .cardQtyTextController.text ==
                                              'true')
                                          ? null
                                          : () async {
                                              logFirebaseEvent(
                                                  'CARD_OPTION_MENU_COMP_remove_ICN_ON_TAP');
                                              if (!((String qty) {
                                                return int.parse(qty) <= 1;
                                              }(_model.cardQtyTextController
                                                  .text))) {
                                                logFirebaseEvent(
                                                    'IconButton_set_form_field');
                                                safeSetState(() {
                                                  _model.cardQtyTextController
                                                      ?.text = (int.parse(_model
                                                              .cardQtyTextController
                                                              .text) -
                                                          1)
                                                      .toString();
                                                });
                                              }
                                            },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                      child: Container(
                                        width: 60.0,
                                        child: Builder(builder: (_) {
                                          if (!cardQtyFocusListenerRegistered) {
                                            cardQtyFocusListenerRegistered =
                                                true;
                                            _model.cardQtyFocusNode!
                                                .addListener(
                                              () async {
                                                logFirebaseEvent(
                                                    'CARD_OPTION_MENU_cardQty_ON_FOCUS_CHANGE');
                                                if (_model.cardQtyTextController
                                                            .text ==
                                                        null ||
                                                    _model.cardQtyTextController
                                                            .text ==
                                                        '') {
                                                  logFirebaseEvent(
                                                      'cardQty_set_form_field');
                                                  safeSetState(() {
                                                    _model.cardQtyTextController
                                                            ?.text =
                                                        containerCardsv2Record
                                                            .quantity
                                                            .toString();
                                                  });
                                                }
                                              },
                                            );
                                          }
                                          return TextFormField(
                                            controller:
                                                _model.cardQtyTextController ??=
                                                    TextEditingController(
                                              text: valueOrDefault<String>(
                                                containerCardsv2Record.quantity
                                                    .toString(),
                                                '0',
                                              ),
                                            ),
                                            focusNode: _model.cardQtyFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            GoogleFonts.asMap()
                                                                .containsKey(
                                                                    'Roboto'),
                                                      ),
                                              hintText: 'Qty...',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            GoogleFonts.asMap()
                                                                .containsKey(
                                                                    'Roboto'),
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      GoogleFonts.asMap()
                                                          .containsKey(
                                                              'Roboto'),
                                                ),
                                            textAlign: TextAlign.center,
                                            maxLength: 2,
                                            maxLengthEnforcement:
                                                MaxLengthEnforcement.enforced,
                                            buildCounter: (context,
                                                    {required currentLength,
                                                    required isFocused,
                                                    maxLength}) =>
                                                null,
                                            keyboardType: TextInputType.number,
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            validator: _model
                                                .cardQtyTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp('[0-9]'))
                                            ],
                                          );
                                        }),
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).primary,
                                      icon: Icon(
                                        Icons.add,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'CARD_OPTION_MENU_COMP_add_ICN_ON_TAP');
                                        if (int.parse(_model
                                                .cardQtyTextController.text) <
                                            99) {
                                          logFirebaseEvent(
                                              'IconButton_set_form_field');
                                          safeSetState(() {
                                            _model.cardQtyTextController
                                                ?.text = (int.parse(_model
                                                        .cardQtyTextController
                                                        .text) +
                                                    1)
                                                .toString();
                                          });
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        Container(
                          width: double.infinity,
                          height: 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                        if (!widget!.inCollection!)
                          AuthUserStreamWidget(
                            builder: (context) => FFButtonWidget(
                              onPressed: ((currentUserDocument?.cardIDs
                                                  ?.toList() ??
                                              [])
                                          .contains(
                                              containerCardsv2Record.id) ==
                                      true)
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'CARD_OPTION_MENU_ADD_TO_COLLECTION_BTN_O');
                                      final firestoreBatch =
                                          FirebaseFirestore.instance.batch();
                                      try {
                                        logFirebaseEvent('Button_backend_call');

                                        firestoreBatch.set(
                                            Cardsv2Record.collection.doc(), {
                                          ...createCardsv2RecordData(
                                            user: currentUserReference,
                                            image: containerCardsv2Record.image,
                                            id: containerCardsv2Record.id,
                                            name: containerCardsv2Record.name,
                                            imageL:
                                                containerCardsv2Record.imageL,
                                            cardType:
                                                containerCardsv2Record.cardType,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'date_added':
                                                  FieldValue.serverTimestamp(),
                                            },
                                          ),
                                        });
                                        logFirebaseEvent('Button_backend_call');

                                        firestoreBatch
                                            .update(currentUserReference!, {
                                          ...mapToFirestore(
                                            {
                                              'cardIDs': FieldValue.arrayUnion(
                                                  [containerCardsv2Record.id]),
                                            },
                                          ),
                                        });
                                        logFirebaseEvent(
                                            'Button_google_analytics_event');
                                        logFirebaseEvent('addCollection');
                                      } finally {
                                        await firestoreBatch.commit();
                                      }
                                    },
                              text: 'ADD TO COLLECTION',
                              icon: Icon(
                                Icons.add_to_photos,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 55.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w900,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                                disabledColor: Color(0xFFBCBCBC),
                                disabledTextColor: Color(0xFF6D7A83),
                              ),
                            ),
                          ),
                        Container(
                          width: double.infinity,
                          height: 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'CARD_OPTION_MENU_ADD_TO_DECK_BTN_ON_TAP');
                            logFirebaseEvent('Button_bottom_sheet');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: AddToDeckWidget(
                                    image: containerCardsv2Record.image,
                                    name: containerCardsv2Record.name,
                                    id: containerCardsv2Record.id,
                                    imageL: containerCardsv2Record.imageL,
                                    cardType: containerCardsv2Record.cardType,
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));

                            logFirebaseEvent('Button_google_analytics_event');
                            logFirebaseEvent('addDeck');
                          },
                          text: 'ADD TO DECK',
                          icon: Icon(
                            Icons.add_to_photos,
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 55.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w900,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                        if (containerCardsv2Record.user == currentUserReference)
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              StreamBuilder<Cardsv2Record>(
                                stream:
                                    Cardsv2Record.getDocument(widget!.cardRef!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }

                                  final buttonCardsv2Record = snapshot.data!;

                                  return FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'CARD_OPTION_MENU_FAVORITE_BTN_ON_TAP');
                                      if (buttonCardsv2Record.isFav) {
                                        logFirebaseEvent('Button_backend_call');

                                        await widget!.cardRef!
                                            .update(createCardsv2RecordData(
                                          isFav: false,
                                        ));
                                      } else {
                                        logFirebaseEvent('Button_backend_call');

                                        await widget!.cardRef!.update({
                                          ...createCardsv2RecordData(
                                            isFav: true,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'favDate':
                                                  FieldValue.serverTimestamp(),
                                            },
                                          ),
                                        });
                                      }

                                      logFirebaseEvent(
                                          'Button_google_analytics_event');
                                      logFirebaseEvent('cardFavChange');
                                    },
                                    text: buttonCardsv2Record.isFav
                                        ? 'UNFAVORITE'
                                        : 'FAVORITE',
                                    icon: Icon(
                                      Icons.star_sharp,
                                      color: Color(0xFFF9B205),
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 55.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w900,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily),
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(0.0),
                                        topRight: Radius.circular(0.0),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Container(
                                width: double.infinity,
                                height: 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'CARD_OPTION_MENU_COMP_DELETE_BTN_ON_TAP');
                                  logFirebaseEvent('Button_backend_call');
                                  await widget!.cardRef!.delete();
                                  logFirebaseEvent('Button_backend_call');

                                  await currentUserReference!.update({
                                    ...mapToFirestore(
                                      {
                                        'cardIDs': FieldValue.arrayRemove(
                                            [containerCardsv2Record.id]),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent('Button_bottom_sheet');
                                  Navigator.pop(context);
                                  logFirebaseEvent(
                                      'Button_google_analytics_event');
                                  logFirebaseEvent('delCard');
                                },
                                text: 'DELETE',
                                icon: Icon(
                                  Icons.delete,
                                  color: Color(0xFFFC0000),
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 55.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Color(0xFFFC0000),
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ],
                          ),
                        Container(
                          height: 65.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'CARD_OPTION_MENU_COMP_DONE_BTN_ON_TAP');
                            if (containerCardsv2Record.user ==
                                currentUserReference) {
                              if ((int.parse(
                                          _model.cardQtyTextController.text) <
                                      1) ||
                                  (_model.cardQtyTextController.text == null ||
                                      _model.cardQtyTextController.text ==
                                          '')) {
                                logFirebaseEvent('Button_set_form_field');
                                safeSetState(() {
                                  _model.cardQtyTextController?.text =
                                      containerCardsv2Record.quantity
                                          .toString();
                                });
                              } else {
                                logFirebaseEvent('Button_backend_call');

                                await widget!.cardRef!
                                    .update(createCardsv2RecordData(
                                  quantity: _model.cardQtyTextController.text ==
                                              null ||
                                          _model.cardQtyTextController.text ==
                                              ''
                                      ? containerCardsv2Record.quantity
                                      : int.tryParse(
                                          _model.cardQtyTextController.text),
                                ));
                              }
                            } else {
                              logFirebaseEvent('Button_set_form_field');
                              safeSetState(() {
                                _model.cardQtyTextController?.text = '0';
                              });
                            }

                            logFirebaseEvent('Button_bottom_sheet');
                            Navigator.pop(context);
                          },
                          text: 'Done',
                          icon: Icon(
                            Icons.check,
                            color: FlutterFlowTheme.of(context).success,
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 55.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
