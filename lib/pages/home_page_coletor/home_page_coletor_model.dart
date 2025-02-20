import '/backend/supabase/supabase.dart';
import '/components/nav_bar_coletor_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'home_page_coletor_widget.dart' show HomePageColetorWidget;
import 'package:flutter/material.dart';

class HomePageColetorModel extends FlutterFlowModel<HomePageColetorWidget> {
  ///  State fields for stateful widgets in this page.

  Completer<List<ColetasRow>>? requestCompleter2;
  Completer<List<ColetasRow>>? requestCompleter1;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<HistoricoRow>? hist;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<HistoricoRow>? historico;
  // Model for NavBarColetor component.
  late NavBarColetorModel navBarColetorModel;

  @override
  void initState(BuildContext context) {
    navBarColetorModel = createModel(context, () => NavBarColetorModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    navBarColetorModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
