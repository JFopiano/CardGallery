import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile/card/card_widget.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'deck_model.dart';
export 'deck_model.dart';

class DeckWidget extends StatefulWidget {
  const DeckWidget({
    super.key,
    required this.user,
  });

  final DocumentReference? user;

  @override
  State<DeckWidget> createState() => _DeckWidgetState();
}

class _DeckWidgetState extends State<DeckWidget> {
  late DeckModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeckModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: StreamBuilder<List<Cardsv2Record>>(
            stream: queryCardsv2Record(
              queryBuilder: (cardsv2Record) => cardsv2Record.where(
                'user',
                isEqualTo: currentUserReference,
              ),
              limit: 5,
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
              List<Cardsv2Record> listViewCardsv2RecordList = snapshot.data!;

              return ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: listViewCardsv2RecordList.length,
                separatorBuilder: (_, __) => SizedBox(width: 13.0),
                itemBuilder: (context, listViewIndex) {
                  final listViewCardsv2Record =
                      listViewCardsv2RecordList[listViewIndex];
                  return CardWidget(
                    key: Key(
                        'Keyrf7_${listViewIndex}_of_${listViewCardsv2RecordList.length}'),
                    imgPath: listViewCardsv2Record.image,
                    name: listViewCardsv2Record.id,
                    id: listViewCardsv2Record.name,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
