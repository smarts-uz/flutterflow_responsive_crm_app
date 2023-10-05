import '/backend/api_requests/api_manager.dart';
import '/backend/supabase/supabase.dart';
import '/components/modal_sections/modal_user/modal_user_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';

Future openUserDetails(BuildContext context) async {
  if (MediaQuery.sizeOf(context).width <= 991.0) {
    context.pushNamed(
      'userDetails',
      queryParameters: {
        'showBack': serializeParam(
          true,
          ParamType.bool,
        ),
      }.withoutNulls,
    );
  } else {
    await showAlignedDialog(
      barrierColor: FlutterFlowTheme.of(context).accent4,
      context: context,
      isGlobal: true,
      avoidOverflow: false,
      targetAnchor:
          AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
      followerAnchor:
          AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
      builder: (dialogContext) {
        return Material(
          color: Colors.transparent,
          child: ModalUserWidget(),
        );
      },
    );
  }
}
