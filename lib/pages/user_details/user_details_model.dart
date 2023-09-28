import '/components/modal_sections/user_details_main/user_details_main_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'user_details_widget.dart' show UserDetailsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserDetailsModel extends FlutterFlowModel<UserDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for user_Details_main component.
  late UserDetailsMainModel userDetailsMainModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    userDetailsMainModel = createModel(context, () => UserDetailsMainModel());
  }

  void dispose() {
    userDetailsMainModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
