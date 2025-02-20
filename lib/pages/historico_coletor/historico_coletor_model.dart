import '/backend/supabase/supabase.dart';
import '/components/nav_bar_coletor_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'historico_coletor_widget.dart' show HistoricoColetorWidget;
import 'package:flutter/material.dart';

class HistoricoColetorModel extends FlutterFlowModel<HistoricoColetorWidget> {
  ///  State fields for stateful widgets in this page.

  Completer<List<HistoricoRow>>? requestCompleter;
  // Model for NavBarColetor component.
  late NavBarColetorModel navBarColetorModel;

  @override
  void initState(BuildContext context) {
    navBarColetorModel = createModel(context, () => NavBarColetorModel());
  }

  @override
  void dispose() {
    navBarColetorModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
