import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/aceitar_coleta_widget.dart';
import '/components/nav_bar_coletor_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'home_page_coletor_model.dart';
export 'home_page_coletor_model.dart';

/// Adicione o nome que está na tabela do supabase acima do campo que está a
/// data
class HomePageColetorWidget extends StatefulWidget {
  const HomePageColetorWidget({
    super.key,
    required this.tabIndex,
  });

  final int? tabIndex;

  @override
  State<HomePageColetorWidget> createState() => _HomePageColetorWidgetState();
}

class _HomePageColetorWidgetState extends State<HomePageColetorWidget>
    with TickerProviderStateMixin {
  late HomePageColetorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageColetorModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: min(
          valueOrDefault<int>(
            widget.tabIndex,
            0,
          ),
          1),
    )..addListener(() => safeSetState(() {}));
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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).warning,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      FlutterFlowTheme.of(context).primary,
                      const Color(0xFFF9CF58)
                    ],
                    stops: const [0.0, 1.0],
                    begin: const AlignmentDirectional(0.0, -1.0),
                    end: const AlignmentDirectional(0, 1.0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'c7qwxpqo' /* Reciclapp */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Inter Tight',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 8.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).primary,
                              icon: Icon(
                                Icons.menu,
                                color: FlutterFlowTheme.of(context).info,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.goNamed('historicoColetor');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 900.0,
                      height: 667.0,
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
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
                                        List<UsuariosRow>
                                            textInitUsuariosRowList =
                                            snapshot.data!;

                                        final textInitUsuariosRow =
                                            textInitUsuariosRowList.isNotEmpty
                                                ? textInitUsuariosRowList.first
                                                : null;

                                        return Text(
                                          'Olá, ${textInitUsuariosRow?.nome}',
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Inter Tight',
                                                letterSpacing: 0.0,
                                              ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'p6y7xnll' /*  */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Inter Tight',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 16.0, 0.0),
                                      child: Icon(
                                        Icons.star,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 30.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 50.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          if (_model.tabBarCurrentIndex == 0) {
                                            safeSetState(() => _model
                                                .requestCompleter2 = null);
                                            await _model
                                                .waitForRequestCompleted2();
                                            return;
                                          } else {
                                            if (_model.tabBarCurrentIndex ==
                                                1) {
                                              safeSetState(() => _model
                                                  .requestCompleter1 = null);
                                              await _model
                                                  .waitForRequestCompleted1();
                                              return;
                                            } else {
                                              return;
                                            }
                                          }
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'r7ro9w4d' /* Atualizar */,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Inter Tight',
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: const Alignment(0.0, 0),
                                    child: TabBar(
                                      labelColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      unselectedLabelColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            letterSpacing: 0.0,
                                          ),
                                      unselectedLabelStyle:
                                          FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Inter Tight',
                                                letterSpacing: 0.0,
                                              ),
                                      indicatorColor:
                                          FlutterFlowTheme.of(context).primary,
                                      tabs: [
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '4ici6nyp' /* Coletas Disponíveis  */,
                                          ),
                                        ),
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'ql03uwes' /* Coletas Agendadas */,
                                          ),
                                        ),
                                      ],
                                      controller: _model.tabBarController,
                                      onTap: (i) async {
                                        [() async {}, () async {}][i]();
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      controller: _model.tabBarController,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 15.0, 0.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.53,
                                                  decoration: const BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 40.0,
                                                                0.0, 0.0),
                                                    child: FutureBuilder<
                                                        List<ColetasRow>>(
                                                      future: (_model
                                                                  .requestCompleter2 ??=
                                                              Completer<
                                                                  List<
                                                                      ColetasRow>>()
                                                                ..complete(
                                                                    ColetasTable()
                                                                        .queryRows(
                                                                  queryFn: (q) =>
                                                                      q.eqOrNull(
                                                                    'status',
                                                                    'Coleta Criada',
                                                                  ),
                                                                )))
                                                          .future,
                                                      builder:
                                                          (context, snapshot) {
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
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<ColetasRow>
                                                            listViewColetasRowList =
                                                            snapshot.data!;

                                                        return ListView
                                                            .separated(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listViewColetasRowList
                                                                  .length,
                                                          separatorBuilder: (_,
                                                                  __) =>
                                                              const SizedBox(
                                                                  height: 8.0),
                                                          itemBuilder: (context,
                                                              listViewIndex) {
                                                            final listViewColetasRow =
                                                                listViewColetasRowList[
                                                                    listViewIndex];
                                                            return Container(
                                                              width: 100.0,
                                                              height: 65.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0x79E0E3E7),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                child: FutureBuilder<
                                                                    List<
                                                                        UsuariosRow>>(
                                                                  future: UsuariosTable()
                                                                      .querySingleRow(
                                                                    queryFn: (q) =>
                                                                        q.eqOrNull(
                                                                      'id',
                                                                      listViewColetasRow
                                                                          .usuarioId,
                                                                    ),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<UsuariosRow>
                                                                        rowUsuariosRowList =
                                                                        snapshot
                                                                            .data!;

                                                                    final rowUsuariosRow = rowUsuariosRowList
                                                                            .isNotEmpty
                                                                        ? rowUsuariosRowList
                                                                            .first
                                                                        : null;

                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Container(
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              const BoxDecoration(),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                dateTimeFormat(
                                                                                  "dd/MM/yyyy",
                                                                                  listViewColetasRow.dataColeta!,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'Inter Tight',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  rowUsuariosRow?.bairro,
                                                                                  'Sem Bairro',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            _model.hist =
                                                                                await HistoricoTable().queryRows(
                                                                              queryFn: (q) => q
                                                                                  .eqOrNull(
                                                                                    'status',
                                                                                    'Coleta Criada',
                                                                                  )
                                                                                  .eqOrNull(
                                                                                    'data',
                                                                                    supaSerialize<DateTime>(listViewColetasRow.dataColeta),
                                                                                  ),
                                                                            );
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return GestureDetector(
                                                                                  onTap: () {
                                                                                    FocusScope.of(context).unfocus();
                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                  },
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                    child: AceitarColetaWidget(
                                                                                      pmtUsuarios: rowUsuariosRow!,
                                                                                      pmtColeta: listViewColetasRow.id,
                                                                                      pmtHistorico: _model.hist!.firstOrNull!.id,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));

                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                const BoxDecoration(),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'yrqs576i' /* Ver Mais */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Inter Tight',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ].divide(const SizedBox(
                                                                              width: 15.0)),
                                                                    );
                                                                  },
                                                                ),
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
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 15.0, 0.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.53,
                                                  decoration: const BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 40.0,
                                                                0.0, 0.0),
                                                    child: FutureBuilder<
                                                        List<ColetasRow>>(
                                                      future: (_model
                                                                  .requestCompleter1 ??=
                                                              Completer<
                                                                  List<
                                                                      ColetasRow>>()
                                                                ..complete(
                                                                    ColetasTable()
                                                                        .queryRows(
                                                                  queryFn: (q) => q
                                                                      .eqOrNull(
                                                                        'coletor_id',
                                                                        currentUserUid,
                                                                      )
                                                                      .eqOrNull(
                                                                        'status',
                                                                        'Em Andamento',
                                                                      ),
                                                                )))
                                                          .future,
                                                      builder:
                                                          (context, snapshot) {
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
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<ColetasRow>
                                                            listViewColetasRowList =
                                                            snapshot.data!;

                                                        return ListView
                                                            .separated(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listViewColetasRowList
                                                                  .length,
                                                          separatorBuilder: (_,
                                                                  __) =>
                                                              const SizedBox(
                                                                  height: 8.0),
                                                          itemBuilder: (context,
                                                              listViewIndex) {
                                                            final listViewColetasRow =
                                                                listViewColetasRowList[
                                                                    listViewIndex];
                                                            return Container(
                                                              width: 100.0,
                                                              height: 65.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0x79E0E3E7),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                child: FutureBuilder<
                                                                    List<
                                                                        UsuariosRow>>(
                                                                  future: UsuariosTable()
                                                                      .querySingleRow(
                                                                    queryFn: (q) =>
                                                                        q.eqOrNull(
                                                                      'id',
                                                                      listViewColetasRow
                                                                          .usuarioId,
                                                                    ),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<UsuariosRow>
                                                                        rowUsuariosRowList =
                                                                        snapshot
                                                                            .data!;

                                                                    final rowUsuariosRow = rowUsuariosRowList
                                                                            .isNotEmpty
                                                                        ? rowUsuariosRowList
                                                                            .first
                                                                        : null;

                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Container(
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              const BoxDecoration(),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                dateTimeFormat(
                                                                                  "dd/MM/yyyy",
                                                                                  listViewColetasRow.dataColeta!,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'Inter Tight',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  rowUsuariosRow?.bairro,
                                                                                  'Sem Bairro',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            _model.historico =
                                                                                await HistoricoTable().queryRows(
                                                                              queryFn: (q) => q.eqOrNull(
                                                                                'data',
                                                                                supaSerialize<DateTime>(listViewColetasRow.dataColeta),
                                                                              ),
                                                                            );
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return GestureDetector(
                                                                                  onTap: () {
                                                                                    FocusScope.of(context).unfocus();
                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                  },
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                    child: AceitarColetaWidget(
                                                                                      pmtUsuarios: rowUsuariosRow!,
                                                                                      pmtColeta: listViewColetasRow.id,
                                                                                      pmtHistorico: _model.historico!.firstOrNull!.id,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));

                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                const BoxDecoration(),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    '06sx8q8s' /* Ver Mais */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Inter Tight',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ].divide(const SizedBox(
                                                                              width: 15.0)),
                                                                    );
                                                                  },
                                                                ),
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            wrapWithModel(
              model: _model.navBarColetorModel,
              updateCallback: () => safeSetState(() {}),
              child: const NavBarColetorWidget(
                ativacao: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
