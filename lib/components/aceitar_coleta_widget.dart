import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'aceitar_coleta_model.dart';
export 'aceitar_coleta_model.dart';

class AceitarColetaWidget extends StatefulWidget {
  const AceitarColetaWidget({
    super.key,
    required this.pmtUsuarios,
    required this.pmtColeta,
    required this.pmtHistorico,
  });

  final UsuariosRow? pmtUsuarios;
  final int? pmtColeta;
  final int? pmtHistorico;

  @override
  State<AceitarColetaWidget> createState() => _AceitarColetaWidgetState();
}

class _AceitarColetaWidgetState extends State<AceitarColetaWidget> {
  late AceitarColetaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AceitarColetaModel());

    _model.textFullAdressTextController ??= TextEditingController(
        text: '${valueOrDefault<String>(
      widget.pmtUsuarios?.rua,
      'Sem Rua',
    )}${', ${valueOrDefault<String>(
      widget.pmtUsuarios?.numero?.toString(),
      'SN',
    )}'}${' - ${valueOrDefault<String>(
      widget.pmtUsuarios?.bairro,
      'Sem Bairro',
    )}'}${', ${valueOrDefault<String>(
      widget.pmtUsuarios?.cidade,
      'Sem Cidade',
    )}'}${' - ${valueOrDefault<String>(
      widget.pmtUsuarios?.estado,
      'Sem Estado',
    )}'}${', ${valueOrDefault<String>(
      widget.pmtUsuarios?.cep,
      'Sem Cep',
    )}'}');
    _model.textFullAdressFocusNode ??= FocusNode();

    _model.tfDescriptionTextController ??= TextEditingController();
    _model.tfDescriptionFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            FlutterFlowTheme.of(context).primary,
            FlutterFlowTheme.of(context).secondary
          ],
          stops: const [0.0, 1.0],
          begin: const AlignmentDirectional(0.0, -1.0),
          end: const AlignmentDirectional(0, 1.0),
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: FutureBuilder<List<ColetasRow>>(
          future: ColetasTable().querySingleRow(
            queryFn: (q) => q.eqOrNull(
              'id',
              widget.pmtColeta,
            ),
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
            List<ColetasRow> columnColetasRowList = snapshot.data!;

            final columnColetasRow = columnColetasRowList.isNotEmpty
                ? columnColetasRowList.first
                : null;

            return Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    width: 100.0,
                    height: 10.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).warning,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '6u5uugl4' /* Detalhes da coleta */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter Tight',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FutureBuilder<List<UsuariosRow>>(
                        future: UsuariosTable().querySingleRow(
                          queryFn: (q) => q.eqOrNull(
                            'id',
                            columnColetasRow?.usuarioId,
                          ),
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
                          List<UsuariosRow> rowUsuariosRowList = snapshot.data!;

                          final rowUsuariosRow = rowUsuariosRowList.isNotEmpty
                              ? rowUsuariosRowList.first
                              : null;

                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Solicitante: ${rowUsuariosRow?.nome}',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter Tight',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          );
                        },
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await Clipboard.setData(ClipboardData(
                              text: _model.textFullAdressTextController.text));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Copiado para Área de Transferência!',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Inter Tight',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: 200.0,
                                child: TextFormField(
                                  controller:
                                      _model.textFullAdressTextController,
                                  focusNode: _model.textFullAdressFocusNode,
                                  autofocus: false,
                                  readOnly: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'vjnakmk5' /* Endereço */,
                                    ),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                  maxLines: null,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model
                                      .textFullAdressTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await Clipboard.setData(ClipboardData(
                                    text: _model
                                        .textFullAdressTextController.text));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Copiado para Área de Transferência!',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    duration: const Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.content_copy_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                          ].divide(const SizedBox(width: 8.0)),
                        ),
                      ),
                      if (columnColetasRow?.status == 'Em Andamento')
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'hrv4xevm' /* Por favor dê uma nota para est... */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter Tight',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RatingBar.builder(
                                  onRatingUpdate: (newValue) => safeSetState(
                                      () => _model.ratingBarValue = newValue),
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star_rounded,
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                  direction: Axis.horizontal,
                                  initialRating: _model.ratingBarValue ??= 0.0,
                                  unratedColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  itemCount: 5,
                                  itemSize: 50.0,
                                  glowColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    width: 200.0,
                                    child: TextFormField(
                                      controller:
                                          _model.tfDescriptionTextController,
                                      focusNode: _model.tfDescriptionFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          '4net91ow' /* Descrição */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'hs3tasrd' /* Escreva uma Descrição sobre a ... */,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                      maxLines: null,
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model
                                          .tfDescriptionTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ].divide(const SizedBox(height: 16.0)),
                        ),
                    ].divide(const SizedBox(height: 16.0)),
                  ),
                ),
                if (columnColetasRow?.status == 'Coleta Criada')
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 100.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'prwa4qbl' /* CANCELAR */,
                                ),
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          var confirmDialogResponse = await showDialog<bool>(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: const Text('Confirmação de Coleta'),
                                    content: const Text(
                                        'Deseja realmente confirmar essa coleta?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, false),
                                        child: const Text('Cancelar'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, true),
                                        child: const Text('Confirmar'),
                                      ),
                                    ],
                                  );
                                },
                              ) ??
                              false;
                          if (confirmDialogResponse) {
                            await ColetasTable().update(
                              data: {
                                'coletor_id': currentUserUid,
                                'status': 'Em Andamento',
                              },
                              matchingRows: (rows) => rows.eqOrNull(
                                'id',
                                widget.pmtColeta,
                              ),
                            );
                            await Future.delayed(
                                const Duration(milliseconds: 1000));
                            await HistoricoTable().update(
                              data: {
                                'status': 'Em Andamento',
                                'coletor_id': currentUserUid,
                              },
                              matchingRows: (rows) => rows.eqOrNull(
                                'id',
                                widget.pmtHistorico,
                              ),
                            );
                            Navigator.pop(context);
                          } else {
                            return;
                          }

                          context.pushNamed(
                            'homePageColetor',
                            queryParameters: {
                              'tabIndex': serializeParam(
                                0,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Coleta aceita com sucesso!',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Inter Tight',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                        },
                        text: FFLocalizations.of(context).getText(
                          's5bh1iwn' /* Aceitar */,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter Tight',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).warning,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ],
                  ),
                if ((columnColetasRow?.status == 'Em Andamento') &&
                    (_model.ratingBarValue != 0.0))
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          var confirmDialogResponse = await showDialog<bool>(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: const Text('Confirmação de Coleta'),
                                    content: const Text(
                                        'Confirma que a coleta foi concluída?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, false),
                                        child: const Text('Cancelar'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, true),
                                        child: const Text('Confirmar'),
                                      ),
                                    ],
                                  );
                                },
                              ) ??
                              false;
                          if (confirmDialogResponse) {
                            await ColetasTable().update(
                              data: {
                                'coletor_id': currentUserUid,
                                'status': 'Finalizada',
                                'avaliacao_coletor':
                                    _model.ratingBarValue?.round(),
                                'descricao': valueOrDefault<String>(
                                  _model.tfDescriptionTextController.text,
                                  '-',
                                ),
                              },
                              matchingRows: (rows) => rows.eqOrNull(
                                'id',
                                widget.pmtColeta,
                              ),
                            );
                            await Future.delayed(
                                const Duration(milliseconds: 1000));
                            await HistoricoTable().update(
                              data: {
                                'status': 'Finalizada',
                                'coletor_id': currentUserUid,
                                'coleta_id': columnColetasRow?.id,
                                'avaliacao_coletor':
                                    _model.ratingBarValue?.round(),
                              },
                              matchingRows: (rows) => rows.eqOrNull(
                                'id',
                                widget.pmtHistorico,
                              ),
                            );
                            Navigator.pop(context);
                          } else {
                            return;
                          }

                          context.pushNamed(
                            'homePageColetor',
                            queryParameters: {
                              'tabIndex': serializeParam(
                                1,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Coleta finalizada com sucesso!',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Inter Tight',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                        },
                        text: FFLocalizations.of(context).getText(
                          'zfcumi3b' /* Finalizar Coleta */,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter Tight',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ],
                  ),
              ].divide(const SizedBox(height: 16.0)),
            );
          },
        ),
      ),
    );
  }
}
