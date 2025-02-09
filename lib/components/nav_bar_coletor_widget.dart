import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'nav_bar_coletor_model.dart';
export 'nav_bar_coletor_model.dart';

class NavBarColetorWidget extends StatefulWidget {
  const NavBarColetorWidget({
    super.key,
    int? ativacao,
  }) : ativacao = ativacao ?? 1;

  final int ativacao;

  @override
  State<NavBarColetorWidget> createState() => _NavBarColetorWidgetState();
}

class _NavBarColetorWidgetState extends State<NavBarColetorWidget>
    with TickerProviderStateMixin {
  late NavBarColetorModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarColetorModel());

    animationsMap.addAll({
      'iconOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(2.0, 2.0),
          ),
        ],
      ),
      'iconOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(2.0, 2.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Stack(
        alignment: const AlignmentDirectional(0.0, 1.0),
        children: [
          Container(
            width: double.infinity,
            height: 70.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(30.0, 8.0, 30.0, 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (animationsMap['iconOnActionTriggerAnimation1'] !=
                              null) {
                            await animationsMap[
                                    'iconOnActionTriggerAnimation1']!
                                .controller
                                .forward(from: 0.0)
                                .whenComplete(animationsMap[
                                        'iconOnActionTriggerAnimation1']!
                                    .controller
                                    .reverse);
                          }

                          context.goNamed(
                            'homePageColetor',
                            queryParameters: {
                              'tabIndex': serializeParam(
                                0,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Icon(
                          Icons.home_outlined,
                          color: widget.ativacao == 1
                              ? FlutterFlowTheme.of(context).secondary
                              : const Color(0xFF02090F),
                          size: 50.0,
                        ),
                      ).animateOnActionTrigger(
                        animationsMap['iconOnActionTriggerAnimation1']!,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (animationsMap['iconOnActionTriggerAnimation2'] !=
                              null) {
                            await animationsMap[
                                    'iconOnActionTriggerAnimation2']!
                                .controller
                                .forward(from: 0.0)
                                .whenComplete(animationsMap[
                                        'iconOnActionTriggerAnimation2']!
                                    .controller
                                    .reverse);
                          }

                          context.goNamed('profilePageColetor');
                        },
                        child: Icon(
                          Icons.person_outline,
                          color: () {
                            if (widget.ativacao == 2) {
                              return FlutterFlowTheme.of(context).secondary;
                            } else if (widget.ativacao == 0) {
                              return const Color(0xFF02090F);
                            } else {
                              return const Color(0xFF02090F);
                            }
                          }(),
                          size: 50.0,
                        ),
                      ).animateOnActionTrigger(
                        animationsMap['iconOnActionTriggerAnimation2']!,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
