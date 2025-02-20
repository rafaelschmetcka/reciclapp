import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'adicionar_coleta_model.dart';
export 'adicionar_coleta_model.dart';

class AdicionarColetaWidget extends StatefulWidget {
  const AdicionarColetaWidget({super.key});

  @override
  State<AdicionarColetaWidget> createState() => _AdicionarColetaWidgetState();
}

class _AdicionarColetaWidgetState extends State<AdicionarColetaWidget> {
  late AdicionarColetaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdicionarColetaModel());

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
      constraints: BoxConstraints(
        maxWidth: 600.0,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF9CF58), FlutterFlowTheme.of(context).secondary],
          stops: [0.0, 1.0],
          begin: AlignmentDirectional(0.0, -1.0),
          end: AlignmentDirectional(0, 1.0),
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(25.0),
        child: FutureBuilder<List<UsuariosRow>>(
          future: UsuariosTable().querySingleRow(
            queryFn: (q) => q.eqOrNull(
              'id',
              currentUserUid,
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
            List<UsuariosRow> columnUsuariosRowList = snapshot.data!;

            final columnUsuariosRow = columnUsuariosRowList.isNotEmpty
                ? columnUsuariosRowList.first
                : null;

            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 100.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    color: Color(0xEA393FEF),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    'ip5ajiu5' /* Escolha uma data para a coleta */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Inter',
                        color: Colors.black,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                      ),
                ),
                Container(
                  width: double.infinity,
                  height: 144.0,
                  constraints: BoxConstraints(
                    maxWidth: 500.0,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0x748B82DB),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: FlutterFlowCalendar(
                    color: Color(0xD94B39EF),
                    weekFormat: true,
                    weekStartsMonday: false,
                    rowHeight: 64.0,
                    onChange: (DateTimeRange? newSelectedDate) {
                      safeSetState(
                          () => _model.calendarSelectedDay = newSelectedDate);
                    },
                    titleStyle:
                        FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Inter Tight',
                              letterSpacing: 0.0,
                            ),
                    dayOfWeekStyle:
                        FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                    dateStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                    selectedDateStyle:
                        FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Inter Tight',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                    inactiveDateStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                    locale: FFLocalizations.of(context).languageCode,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (!((columnUsuariosRow?.cep != null &&
                              columnUsuariosRow?.cep != '') &&
                          (columnUsuariosRow?.estado != null &&
                              columnUsuariosRow?.estado != '') &&
                          (columnUsuariosRow?.cidade != null &&
                              columnUsuariosRow?.cidade != '') &&
                          (columnUsuariosRow?.bairro != null &&
                              columnUsuariosRow?.bairro != '') &&
                          (columnUsuariosRow?.rua != null &&
                              columnUsuariosRow?.rua != '') &&
                          (columnUsuariosRow?.numero != null))) {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Por favor, preencha o endereço!'),
                              content: Text(
                                  'Antes de solicitar uma coleta preencha o endereço completo no seu perfil.'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );

                        context.pushNamed(ProfilePageWidget.routeName);

                        return;
                      }
                      var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text(
                                    'Confirmação de Solicitação de Coleta'),
                                content: Text(
                                    'Deseja realmente solicitar uma coleta para o dia: ${dateTimeFormat(
                                  "dd/MM/yyyy",
                                  _model.calendarSelectedDay?.start,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                )}'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: Text('Cancelar'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: Text('Confirmar'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                      if (confirmDialogResponse) {
                        await ColetasTable().insert({
                          'data_coleta': supaSerialize<DateTime>(
                              _model.calendarSelectedDay?.start),
                          'status': 'Coleta Criada',
                        });
                        await HistoricoTable().insert({
                          'status': 'Coleta Criada',
                          'data': supaSerialize<DateTime>(
                              _model.calendarSelectedDay?.start),
                        });
                        Navigator.pop(context);
                      } else {
                        return;
                      }

                      context.pushNamed(HomePageWidget.routeName);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Coleta agendada com sucesso para o dia ${dateTimeFormat(
                              "dd/MM/yyyy",
                              _model.calendarSelectedDay?.start,
                              locale: FFLocalizations.of(context).languageCode,
                            )}',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                    },
                    text: FFLocalizations.of(context).getText(
                      '2li2ho4x' /* Agendar */,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xD94B39EF),
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
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if ((columnUsuariosRow?.cep == null ||
                            columnUsuariosRow?.cep == '') ||
                        (columnUsuariosRow?.estado == null ||
                            columnUsuariosRow?.estado == '') ||
                        (columnUsuariosRow?.cidade == null ||
                            columnUsuariosRow?.cidade == '') ||
                        (columnUsuariosRow?.bairro == null ||
                            columnUsuariosRow?.bairro == '') ||
                        (columnUsuariosRow?.rua == null ||
                            columnUsuariosRow?.rua == '') ||
                        (columnUsuariosRow?.numero == null))
                      Text(
                        FFLocalizations.of(context).getText(
                          'xla5rxkp' /* Para poder agendar coletas por... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                      ),
                  ],
                ),
              ].divide(SizedBox(height: 16.0)),
            );
          },
        ),
      ),
    );
  }
}
