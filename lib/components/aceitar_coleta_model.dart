import '/flutter_flow/flutter_flow_util.dart';
import 'aceitar_coleta_widget.dart' show AceitarColetaWidget;
import 'package:flutter/material.dart';

class AceitarColetaModel extends FlutterFlowModel<AceitarColetaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for textFullAdress widget.
  FocusNode? textFullAdressFocusNode;
  TextEditingController? textFullAdressTextController;
  String? Function(BuildContext, String?)?
      textFullAdressTextControllerValidator;
  // State field(s) for ratingBar widget.
  double? ratingBarValue;
  // State field(s) for tfDescription widget.
  FocusNode? tfDescriptionFocusNode;
  TextEditingController? tfDescriptionTextController;
  String? Function(BuildContext, String?)? tfDescriptionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFullAdressFocusNode?.dispose();
    textFullAdressTextController?.dispose();

    tfDescriptionFocusNode?.dispose();
    tfDescriptionTextController?.dispose();
  }
}
