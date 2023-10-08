import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'syncfusion_flutter_datagrid_cloud_model.dart';
export 'syncfusion_flutter_datagrid_cloud_model.dart';

class SyncfusionFlutterDatagridCloudWidget extends StatefulWidget {
  const SyncfusionFlutterDatagridCloudWidget({Key? key}) : super(key: key);

  @override
  _SyncfusionFlutterDatagridCloudWidgetState createState() =>
      _SyncfusionFlutterDatagridCloudWidgetState();
}

class _SyncfusionFlutterDatagridCloudWidgetState
    extends State<SyncfusionFlutterDatagridCloudWidget> {
  late SyncfusionFlutterDatagridCloudModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SyncfusionFlutterDatagridCloudModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'syncfusion_flutter_datagridCloud'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              '90wk3wod' /* syncfusion_flutter_datagrid */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium,
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: custom_widgets.SyncfusionFlutterDataGridCloud(
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}
