import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for tfName widget.
  FocusNode? tfNameFocusNode;
  TextEditingController? tfNameTextController;
  String? Function(BuildContext, String?)? tfNameTextControllerValidator;
  String? _tfNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'd0hfpr5r' /* Nome é obrigatório */,
      );
    }

    return null;
  }

  // State field(s) for tfCep widget.
  FocusNode? tfCepFocusNode;
  TextEditingController? tfCepTextController;
  final tfCepMask = MaskTextInputFormatter(mask: '#####-###');
  String? Function(BuildContext, String?)? tfCepTextControllerValidator;
  String? _tfCepTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'gb95rx1x' /* Insira um Cep */,
      );
    }

    return null;
  }

  // State field(s) for tfEstate widget.
  FocusNode? tfEstateFocusNode;
  TextEditingController? tfEstateTextController;
  String? Function(BuildContext, String?)? tfEstateTextControllerValidator;
  String? _tfEstateTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'catgp6cn' /* Insira um Estado */,
      );
    }

    return null;
  }

  // State field(s) for tfCity widget.
  FocusNode? tfCityFocusNode;
  TextEditingController? tfCityTextController;
  String? Function(BuildContext, String?)? tfCityTextControllerValidator;
  String? _tfCityTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'pg39hnsc' /* Insira uma Cidade */,
      );
    }

    return null;
  }

  // State field(s) for tfNeighborhood widget.
  FocusNode? tfNeighborhoodFocusNode;
  TextEditingController? tfNeighborhoodTextController;
  String? Function(BuildContext, String?)?
      tfNeighborhoodTextControllerValidator;
  String? _tfNeighborhoodTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'g7meok6b' /* Insira um Bairro */,
      );
    }

    return null;
  }

  // State field(s) for tfStreet widget.
  FocusNode? tfStreetFocusNode;
  TextEditingController? tfStreetTextController;
  String? Function(BuildContext, String?)? tfStreetTextControllerValidator;
  String? _tfStreetTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '4muslfaj' /* Insira uma Rua */,
      );
    }

    return null;
  }

  // State field(s) for tfNumber widget.
  FocusNode? tfNumberFocusNode;
  TextEditingController? tfNumberTextController;
  String? Function(BuildContext, String?)? tfNumberTextControllerValidator;
  String? _tfNumberTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '33zdxi3b' /* Insira um Número */,
      );
    }

    return null;
  }

  // State field(s) for tfComplement widget.
  FocusNode? tfComplementFocusNode;
  TextEditingController? tfComplementTextController;
  String? Function(BuildContext, String?)? tfComplementTextControllerValidator;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    tfNameTextControllerValidator = _tfNameTextControllerValidator;
    tfCepTextControllerValidator = _tfCepTextControllerValidator;
    tfEstateTextControllerValidator = _tfEstateTextControllerValidator;
    tfCityTextControllerValidator = _tfCityTextControllerValidator;
    tfNeighborhoodTextControllerValidator =
        _tfNeighborhoodTextControllerValidator;
    tfStreetTextControllerValidator = _tfStreetTextControllerValidator;
    tfNumberTextControllerValidator = _tfNumberTextControllerValidator;
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    tfNameFocusNode?.dispose();
    tfNameTextController?.dispose();

    tfCepFocusNode?.dispose();
    tfCepTextController?.dispose();

    tfEstateFocusNode?.dispose();
    tfEstateTextController?.dispose();

    tfCityFocusNode?.dispose();
    tfCityTextController?.dispose();

    tfNeighborhoodFocusNode?.dispose();
    tfNeighborhoodTextController?.dispose();

    tfStreetFocusNode?.dispose();
    tfStreetTextController?.dispose();

    tfNumberFocusNode?.dispose();
    tfNumberTextController?.dispose();

    tfComplementFocusNode?.dispose();
    tfComplementTextController?.dispose();

    navBarModel.dispose();
  }
}
