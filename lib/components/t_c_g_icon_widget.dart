import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 't_c_g_icon_model.dart';
export 't_c_g_icon_model.dart';

class TCGIconWidget extends StatefulWidget {
  /// iconType
  const TCGIconWidget({
    super.key,
    required this.iconType,
  });

  final String? iconType;

  @override
  State<TCGIconWidget> createState() => _TCGIconWidgetState();
}

class _TCGIconWidgetState extends State<TCGIconWidget> {
  late TCGIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TCGIconModel());

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
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Stack(
          children: [
            if (widget!.iconType == 'def')
              Container(
                width: 32.0,
                height: 32.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/icon.png',
                    ).image,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            if (widget!.iconType == 'magic')
              Container(
                width: 32.0,
                height: 32.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/magic_circle_icon.png',
                    ).image,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            if (widget!.iconType == 'digimon')
              Container(
                width: 32.0,
                height: 32.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/digimon.webp',
                    ).image,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            if (widget!.iconType == 'dragon-ball-fusion')
              Container(
                width: 32.0,
                height: 32.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: Image.asset(
                      'assets/images/dragon_ball.png',
                    ).image,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            if (widget!.iconType == 'one-piece')
              Container(
                width: 32.0,
                height: 32.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/one_piece.jpg',
                    ).image,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            if (widget!.iconType == 'union-arena')
              Container(
                width: 32.0,
                height: 32.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/union_arena.jpg',
                    ).image,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            if (widget!.iconType == 'pokemon')
              Container(
                width: 32.0,
                height: 32.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/pokemon.jpg',
                    ).image,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
