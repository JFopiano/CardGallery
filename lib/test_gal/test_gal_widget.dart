import '/backend/backend.dart';
import '/components/card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'test_gal_model.dart';
export 'test_gal_model.dart';

class TestGalWidget extends StatefulWidget {
  const TestGalWidget({super.key});

  @override
  State<TestGalWidget> createState() => _TestGalWidgetState();
}

class _TestGalWidgetState extends State<TestGalWidget> {
  late TestGalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestGalModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'testGal'});
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              StreamBuilder<List<CardsRecord>>(
                stream: queryCardsRecord(),
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
                  List<CardsRecord> listViewCardsRecordList = snapshot.data!;

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewCardsRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewCardsRecord =
                          listViewCardsRecordList[listViewIndex];
                      return CardWidget(
                        key: Key(
                            'Keyq95_${listViewIndex}_of_${listViewCardsRecordList.length}'),
                        imgPath: listViewCardsRecord.image,
                      );
                    },
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
