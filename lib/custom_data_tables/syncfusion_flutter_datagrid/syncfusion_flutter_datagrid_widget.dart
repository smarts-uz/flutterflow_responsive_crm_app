import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'syncfusion_flutter_datagrid_model.dart';
export 'syncfusion_flutter_datagrid_model.dart';

class SyncfusionFlutterDatagridWidget extends StatefulWidget {
  const SyncfusionFlutterDatagridWidget({Key? key}) : super(key: key);

  @override
  _SyncfusionFlutterDatagridWidgetState createState() =>
      _SyncfusionFlutterDatagridWidgetState();
}

class _SyncfusionFlutterDatagridWidgetState
    extends State<SyncfusionFlutterDatagridWidget> {
  late SyncfusionFlutterDatagridModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SyncfusionFlutterDatagridModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'syncfusion_flutter_datagrid'});
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
              'j1k3s749' /* syncfusion_flutter_datagrid */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium,
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: FutureBuilder<List<CustomersRow>>(
            future: CustomersTable().queryRows(
              queryFn: (q) => q,
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
              List<CustomersRow>
                  syncfusionFlutterDataGridCloudCustomersRowList =
                  snapshot.data!;
              return Container(
                width: double.infinity,
                height: double.infinity,
                child: custom_widgets.SyncfusionFlutterDataGrid(
                  width: double.infinity,
                  height: double.infinity,
                  customers: syncfusionFlutterDataGridCloudCustomersRowList,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
