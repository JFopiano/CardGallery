import '/backend/api_requests/api_calls.dart';
import '/components/card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'result_cards_model.dart';
export 'result_cards_model.dart';

class ResultCardsWidget extends StatefulWidget {
  /// a page for the pictures of the cards returned from the api
  ///
  const ResultCardsWidget({
    super.key,
    required this.cardType,
    required this.cardName,
  });

  final String? cardType;
  final String? cardName;

  @override
  State<ResultCardsWidget> createState() => _ResultCardsWidgetState();
}

class _ResultCardsWidgetState extends State<ResultCardsWidget> {
  late ResultCardsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResultCardsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'resultCards'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FutureBuilder<ApiCallResponse>(
                  future: GetPokemonCall.call(
                    cardType: widget.cardType,
                    cardName: widget.cardName,
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
                        final getPokemon = GetPokemonCall.cardImmage(
                              listViewGetPokemonResponse.jsonBody,
                            )?.toList() ??
                            [];

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: getPokemon.length,
                          itemBuilder: (context, getPokemonIndex) {
                            final getPokemonItem = getPokemon[getPokemonIndex];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CardWidget(
                                key: Key(
                                    'Keyvar_${getPokemonIndex}_of_${getPokemon.length}'),
                                imgPath: getPokemonItem,
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
